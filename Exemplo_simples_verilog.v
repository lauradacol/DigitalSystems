module verilog;
	
	reg a, b, c, d;
	
	wire s1, s2, s3;
	
	and and1(s1, a, b);	
	and and2(s2, s1, c);
	and and3(s3, s2, d);
	
	
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
