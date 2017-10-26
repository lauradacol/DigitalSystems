
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
endmodule
