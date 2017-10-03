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
	l = ((ax*by)+(ay*cx)+(bx*cy)) - ((ay*bx)+(ax*cy)+(by*cx));
end

endmodule

/*
def checkPoint(a,b,c,p):
	triangle = triangleArea(a,b,c)
	
	t1 = triangleArea(a,b,p)
	t2 = triangleArea(a,c,p)
	t3 = triangleArea(b,c,p)
		
	if (t1+t2+t3)<=triangle:
		return True
		
	else:
		return False*/
		
module checkPoint(
	input CLOCK_50,
	input [0:10]ax,
	input [0:10]ay,
	input [0:10]bx,
	input [0:10]by,	
	input [0:10]cx,
	input [0:10]cy,
	input [0:10]px,
	input [0:10]py,		
	output check
);		

reg l;
assign check = l; 
wire [0:20] triangle;
wire [0:20] t1;
wire [0:20] t2;
wire [0:20] t3;

triangleArea triangle1(CLOCK_50, ax,ay,bx,by,cx,cy, triangle);
triangleArea t_1(CLOCK_50, ax,ay,bx,by,px,py, t1);
triangleArea t_2(CLOCK_50, ax,ay,cx,cy,px,py, t2);
triangleArea t_3(CLOCK_50, bx,by,cx,cy,px,py, t3);

always @(triangle or t1 or t2 or t3) begin
	if((t1+t2+t3) <= triangle) begin
		l = 1;
	end

	else begin
		l = 0;
	end
end

endmodule

module testbench;
	
	reg clk = 0;
	reg [0:10]ax;
	reg [0:10]ay;
	reg [0:10]bx;
	reg [0:10]by;	
	reg [0:10]cx;
	reg [0:10]cy;
	reg [0:10]px;
	reg [0:10]py;	
	wire check;
	//wire [0:20]area;
	
	//triangleArea Leds1(clk, ax, ay, bx, by, cx, cy, area);
	
	checkPoint check1(clk, ax, ay, bx, by, cx, cy, px, py, check);
	
	integer count;

	initial begin
		#2
		count = $fscanf('h8000_0000, "%d", ax);
		count = $fscanf('h8000_0000, "%d", ay);
		count = $fscanf('h8000_0000, "%d", bx);
		count = $fscanf('h8000_0000, "%d", by);
		count = $fscanf('h8000_0000, "%d", cx);
		count = $fscanf('h8000_0000, "%d", cy);
		count = $fscanf('h8000_0000, "%d", px);
		count = $fscanf('h8000_0000, "%d", py);		
		#2;
		$display("%d", ax);
		$display("%d", ay);
		$display("%d", bx);
		$display("%d", by);
		$display("%d", cx);
		$display("%d", cy);
		$display("%d", px);
		$display("%d", py);		
		$display("%d", check);
		#2;


	end	
	
	/*
	always #2 clk = ~clk;

	initial begin
    $dumpvars;
    clk <= 0; ax <= 1; ay <= 82; bx <= 47; by <= 1; cx <= 47; cy <=165;    
    #500;
    clk <= 0; ax <= 1; ay <= 5; bx <= 15; by <= 25; cx <= 3; cy <=50;    
    #500;
        
           
    #2000;
    $finish;
  end*/

endmodule
