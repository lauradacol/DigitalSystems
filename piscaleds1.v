module piscaleds1(
	input CLOCK_50,
	input [3:0] KEY,
	output [7:0]LEDG
);

reg [26:0]contador = 0;
reg l = 0;
reg l1 = 1;
reg l3 = 0;

assign LEDG[1] = l1; 
assign LEDG[2] = l;
assign LEDG[3] = l1; 
assign LEDG[4] = l;
assign LEDG[5] = l1; 
assign LEDG[6] = l;
assign LEDG[7] = l1; 

assign LEDG[0] = l3;

always @(posedge CLOCK_50) begin

	if(KEY[0]==1) begin
		l3 = 0;
	end

	if(KEY[0]==0) begin
		l3 = 1;
	end
end
always @(posedge CLOCK_50) begin
	contador = contador + 1;
	
	if(contador == 50000000) begin
		contador = 0;
	end
	
	if(contador == 0) begin
		l = ~l;
	end
	
	if(contador == 0) begin
		l1 = ~l1;
	end
	
end

endmodule
