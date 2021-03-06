module memoria (
	input CLOCK_50,
	input [0:0]KEY,
	output [17:0] SRAM_ADDR,
	inout [15:0]  SRAM_DQ,
	output SRAM_WE_N,
	output SRAM_OE_N,
	output SRAM_UB_N ,
	output SRAM_LB_N,
	output SRAM_CE_N ,
	input [8:0] px, 
	input [8:0] py,
	output o	
);

reg [15:0] data;
reg [17:0] addr;
reg [5:0] count = 0;

reg ready = 0;
reg write = 0;

assign o = ready ? SRAM_DQ[0] : 1'b0;
assign SRAM_ADDR = ready ? {px, py} : addr;
assign SRAM_DQ = ready ? 16'hzzzz : data;

assign SRAM_WE_N = ~write;
assign SRAM_OE_N = write;

assign SRAM_UB_N = 0;
assign SRAM_LB_N = 0;
assign SRAM_CE_N = 0;

wire cp_o;

reg [8:0] x2 = 50;
reg y = 0;

checkPoint Check(CLOCK_50, x2, 20, 80, 75, 150, 70, addr[17:9], addr[8:0], cp_o);

always @(posedge CLOCK_50) begin 
	if(~ready) begin
		count <= count + 1;
		if (count == 30) begin
			write <= 1;
			data <= cp_o;			
		end
		else if (count == 40) begin
			write <= 0;
			addr <= addr + 1;
		end
		if (addr == 18'hfffff) begin
			ready <= 1;
			y <= 0;
		end

	end
	
	else if(~KEY[0] & ~y) begin
		count <= 0;
		ready <= 0;
		addr <= 0;
		x2 <= x2 + 10;
		y <= 1;
	end
	
end

endmodule