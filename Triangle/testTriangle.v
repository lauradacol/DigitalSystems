
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

	reg [0:6] testes = 0; 

	checkPoint check1(clk, ax, ay, bx, by, cx, cy, px, py, check);
	
	integer count;

	initial begin
		$dumpvars;
		#2;
	end	
		
	always #2 clk = ~clk;
		
	always @(posedge clk) begin
	
		count = $fscanf('h8000_0000, "%d", ax);
		count = $fscanf('h8000_0000, "%d", ay);
		count = $fscanf('h8000_0000, "%d", bx);
		count = $fscanf('h8000_0000, "%d", by);
		count = $fscanf('h8000_0000, "%d", cx);
		count = $fscanf('h8000_0000, "%d", cy);
		count = $fscanf('h8000_0000, "%d", px);
		count = $fscanf('h8000_0000, "%d", py);		
		#2;
		$display("%d", check);
		
		testes = testes + 1;
		#2;

		if(testes >=50) begin
			$finish;
		end
	end
endmodule
