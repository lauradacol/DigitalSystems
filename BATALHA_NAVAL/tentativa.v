module verilog;
	
	reg [3:0] jog_a;
	reg [3:0] jog_b;
	reg invalid_play = 0;
	
// invalid_play
	
	if((jog_a[0]==jog_a[1]) && (jog_a[1]==jog_a[2]]) && (jog_a[2]==0))
		invalid_play = 1;
	
	
	
	
		
	
initial begin
		$dumpvars(0, a, b, c, d, s3);
		#2 a <= 0; b <= 0; c <= 0; d <= 0;  
		#2 a <= 1; b <= 0; c <= 0; d <= 0;
		#2 a <= 0; b <= 1; c <= 0; d <= 0;  
		#2 a <= 1; b <= 1; c <= 0; d <= 0;  
		#2 a <= 0; b <= 0; c <= 1; d <= 0;  
		#2 a <= 1; b <= 0; c <= 1; d <= 0;  
		#2 a <= 0; b <= 1; c <= 1; d <= 0;  
		#2 a <= 1; b <= 1; c <= 1; d <= 0;  
		#2 a <= 0; b <= 0; c <= 0; d <= 1;  
		#2 a <= 1; b <= 0; c <= 0; d <= 1;  
		#2 a <= 0; b <= 1; c <= 0; d <= 1;  
		#2 a <= 1; b <= 1; c <= 0; d <= 1;  
		#2 a <= 0; b <= 0; c <= 1; d <= 1;  
		#2 a <= 1; b <= 0; c <= 1; d <= 1;  
		#2 a <= 0; b <= 1; c <= 1; d <= 1;  
		#2 a <= 1; b <= 1; c <= 1; d <= 1; 
	end
endmodule
