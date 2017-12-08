module triangle (
  	input CLOCK_50,	
	input [0:0]KEY,
	output [17:0] SRAM_ADDR,
	inout [15:0]  SRAM_DQ,
	output SRAM_WE_N,
	output SRAM_OE_N,
	output SRAM_UB_N ,
	output SRAM_LB_N,
	output SRAM_CE_N ,
  	output [3:0] VGA_R,
  	output [3:0] VGA_G,
	output [3:0] VGA_B,
 	output VGA_HS,
	output VGA_VS
);

reg [10:0] cx = 0;
reg [9:0]  cy = 0;

assign VGA_R = (v & r) ? 4'hf : 4'b0;
assign VGA_G = (v & q) ? 4'hf : 4'b0;
assign VGA_B = v ? 4'hf : 4'b0;

//minha área visivel
wire v = (cx >= 285) & (cx < 1555) & (cy >= 35) & (cy < 515);

//meu retangulo
wire q = (cx >= 300) & (cx < 750) & (cy >= 50) & (cy < 300);

//meu triangulo
wire r;

//Para passar o px e py como entrada do módulo m1 de acordo com a area visivel
wire [10:0] px = cx - 285;
wire [9:0] py = cy - 35;

memoria m1(CLOCK_50, KEY[0:0], SRAM_ADDR, SRAM_DQ, SRAM_WE_N, SRAM_OE_N, SRAM_UB_N, SRAM_LB_N,SRAM_CE_N, px[10:2], py[9:1], r);

assign VGA_HS = cx >= 190;
assign VGA_VS = cy >= 2;

always @(posedge CLOCK_50) begin
	if (cx == 1585) 
    begin
        if (cy == 525) begin
			cy <= 0;
        end
		else 
			cy <= cy + 1;
		cx <= 0;
	end
    else 
    begin
		cx <= cx + 1;
    end
end

endmodule