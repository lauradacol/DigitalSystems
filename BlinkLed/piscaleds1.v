module piscaleds1(
	input CLOCK_50,
	input [0:0]KEY,
	output [0:0]LEDG
);

reg [26:0]contador = 0;
reg l = 0;
reg [5:0] passo = 1;

assign LEDG[0] = l;


always @(posedge CLOCK_50) begin

	if(KEY[0]==1) begin
		passo = 1;
	end

	else begin
		passo = 5;
	end
	
	if(contador >= 50000000) begin
		contador = 0;
		l = ~l;
	end
	
	else begin
		contador = contador + passo;
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
