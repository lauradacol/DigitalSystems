module piscaleds1(
	input CLOCK_50,
	input [0:0]KEY,
	output [0:0]LEDG
);

reg [26:0]contador = 0;
reg l = 0;
reg passo = 1;

/*
assign LEDG[1] = l1; 
assign LEDG[2] = l;
assign LEDG[3] = l1; 
assign LEDG[4] = l;
assign LEDG[5] = l1; 
assign LEDG[6] = l;
assign LEDG[7] = l1; 
*/
assign LEDG[0] = l;


always @(posedge CLOCK_50) begin

	if(KEY[0]==0) begin
		passo = 1;
	end

	if(KEY[0]==1) begin
		passo = 100;
	end
end

always @(posedge CLOCK_50) begin
	contador = contador + passo;
	
	if(contador == 500) begin
		contador = 0;
	end
	
	if(contador == 0) begin
		l = ~l;
	end

end

endmodule

module testbench;
	
	wire [0:0]ledg;
	reg clk = 0;
	reg [0:0]key;
	
	piscaleds1 Leds1(clk, key, ledg);
	
	always #2 clk = ~clk;

	initial begin
    $dumpvars;
    clk <= 0; key<=0;
    
    #10000;
    key <= 1;
    #10000;
    key <= 0;
        
           
    #50000;
    $finish;
  end

endmodule











