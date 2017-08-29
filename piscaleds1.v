module piscaleds1(
	input CLOCK_50,
	output [5:0]LEDG
);

reg [26:0]contador = 0;
reg l = 0;

assign LEDG = l;

always @(posedge CLOCK_50) begin
	contador = contador + 1;
	
	if(contador == 50000000) begin
		contador = 0;
	end
	
	if(contador == 0) begin
		l = ~l;
	end
end

endmodule