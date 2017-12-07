module triangle (
  	input CLOCK_50,
  	output [3:0] VGA_R,
  	output [3:0] VGA_G,
	output [3:0] VGA_B,
 	output VGA_HS,
	output VGA_VS
);

reg [10:0] cx = 0;
reg [9:0]  cy = 0;
//reg [11:0] c;
//wire [11:0] c;

assign VGA_R = (v & r) ? 5'hf : 4'b0;
assign VGA_G = (v & q) ? 9'hf : 4'b0;
assign VGA_B = v ? 3'hf : 4'b0;

//assign VGA_R = r2 ? 4'hf : 4'b0;
//assign VGA_G = r2 ? 4'hf : 4'b0;
//assign VGA_B = r2 ? 4'hf : 4'b0;

//minha área visivel
wire v = (cx >= 285) & (cx < 1555) & (cy >= 35) & (cy < 515);

//meu retangulo
wire q = (cx >= 300) & (cx < 750) & (cy >= 50) & (cy < 300);

//meu triangulo
wire r;

checkPoint Check(CLOCK_50, 200, 20, 80, 75, 337, 53, cx[10:2], cy[9:1], r);

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
        // cy <= cy;
		cx <= cx + 1;
    end
	 /*
	 if (r) begin
		c = 12'hf00;
	 end
	 else begin
		c = 12'h0f0;
	 end
*/
	 
end

endmodule