module multv(
    input clk,
    input [9:0] x,
    input [9:0] y,
    input reset,
    input enable,
    input signal1,
    input signal2,
    output [19:0] area
    
);

reg [19:0] acumulador = 0;
wire[19:0] saida1;
assign saida1 = acumulador;

always @(posedge clk) begin
    if(reset) begin
        acumulador <= 0;
    end
    else begin
        if (enable) begin
            acumulador <= acumulador + (x * y);
        end
        
        else begin
          acumulador <= acumulador;
		end
    end
end


wire [19:0] saida2;

/*Quando o sinal1 for 1, passar o valor da saida1 para saida 2, zerar a
saída 1 e ligar o reset para zerar o acumulador;
*/
always @(signal1) begin
	saida2 <= saida1;
	saida1 <= 0;
	//reset <= 1;
end

/*Quando o sinal2 for 1, subtrair saida 1 da saida 2;
*/
always @(signal2) begin
	area <= saida1 - saida2;
end

endmodule


module testbench;

    reg clk = 0;
    reg [9:0] x;
    reg [9:0] y;
    reg reset, enable, signal1, signal2;
    wire [19:0] area;

    multv M1(clk, x, y, reset, enable, signal1, signal2, area);


always #2 clk = ~clk;

initial begin
    $dumpvars;
    #10
    reset <= 1;
    signal1 <= 0;
    signal2 <=0;
    
    #8
    enable <= 1;
    reset <= 0;
    x <= 1;
    y <= 1;    
    #4
    x <= 82;
    y <= 47;   
    #4
    x <= 47;
    y <= 165;    
  
    #4
    signal1 <=1;  
    reset <=1;  
    #4
    signal1 <=0;
    reset <=0;
    
    #4
    x <= 82;
    y <= 47;    
    #4
    x <= 1;
    y <= 165;   
    #4
    x <= 1;
    y <= 47;    
      
    #4
    signal2<=1;    


	#4;
    $finish;
end    

endmodule
