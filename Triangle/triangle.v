module triangleArea(
	input CLOCK_50,
	input [0:8]ax,
	input [0:6]ay,
	input [0:8]bx,
	input [0:6]by,	
	input [0:8]cx,
	input [0:6]cy,	

	output [0:13]area
);

reg [0:13] l = 0;
assign area = l; 

/*
def triangleArea(a,b,c):
	A = (a[0]*b[1]*1)+(a[1]*1*c[0])+(1*b[0]*c[1])
	B = (a[1]*b[0]*1)+(a[0]*1*c[1])+(1*b[1]*c[0])
	return abs(A-B)*/

/*Sempre que o valor de alguma coordenada mudar, recalcular*/

always @(ax or ay or bx or by or cx or cy) begin
	wire A = ((ax*by*1)+(ay*1*cx)+(1*bx*cy));
	wire B = ((ay*bx*1)+(ax*1*cy)+(1*by*cx));
	
	l = A - B;
end

endmodule

module testbench;
	
	reg clk = 0;
	wire [0:8]ax,
	wire [0:6]ay,
	wire [0:8]bx,
	wire [0:6]by,	
	wire [0:8]cx,
	wire [0:6]cy,	
	wire [0:13]area;
	
	piscaleds1 Leds1(clk, ax, ay, bx, by, cx, cy, area);
	
	always #2 clk = ~clk;

	initial begin
    $dumpvars;
    clk <= 0; ax <= 1; ay <= 82; bx <= 47; by <= 1; cx <= 47; by <=165;    
    #500;
    clk <= 0; ax <= 1; ay <= 5; bx <= 15; by <= 25; cx <= 3; by <=50;    
    #500;
        
           
    #2000;
    $finish;
  end

endmodule
