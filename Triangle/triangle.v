module triangleArea(
	input CLOCK_50,
	input [0:10]ax,
	input [0:10]ay,
	input [0:10]bx,
	input [0:10]by,	
	input [0:10]cx,
	input [0:10]cy,	

	output [0:20]area
);

reg [0:20] l = 0;
assign area = l; 
 
/*Sempre que o valor de alguma coordenada mudar, recalcular*/

always @(ax or ay or bx or by or cx or cy) begin
	wire A = ((ax*by)+(ay*cx)+(bx*cy));
	wire B = ((ay*bx)+(ax*cy)+(by*cx));
	
	l = A - B;
end

endmodule

module testbench;
	
	reg clk = 0;
	reg [0:10]ax,
	reg [0:10]ay,
	reg [0:10]bx,
	reg [0:10]by,	
	reg [0:10]cx,
	reg [0:10]cy,	
	wire [0:20]area;
	
	piscaleds1 Leds1(clk, ax, ay, bx, by, cx, cy, area);
	
	always #2 clk = ~clk;

	initial begin
    $dumpvars;
    clk <= 0; ax <= 1; ay <= 82; bx <= 47; by <= 1; cx <= 47; cy <=165;    
    #500;
    clk <= 0; ax <= 1; ay <= 5; bx <= 15; by <= 25; cx <= 3; cy <=50;    
    #500;
        
           
    #2000;
    $finish;
  end

endmodule
