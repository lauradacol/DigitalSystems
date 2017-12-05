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

assign VGA_R = (v & r) ? 4'hf : 4'b0;
assign VGA_G = (v & q) ? 4'hf : 4'b0;
assign VGA_B = v ? 4'hf : 4'b0;
//assign VGA_R = r2 ? 4'hf : 4'b0;
//assign VGA_G = r2 ? 4'hf : 4'b0;
//assign VGA_B = r2 ? 4'hf : 4'b0;


wire v = (cx >= 285) & (cx < 1555) & (cy >= 35) & (cy < 515);

wire q = (cx >= 300) & (cx < 1000) & (cy >= 50) & (cy < 300);
wire r;
reg r2;
checkPoint Check(CLOCK_50, 700, 70, 330, 300, 1350, 215, cx, cy, r);

assign VGA_HS = cx >= 190;
assign VGA_VS = cy >= 2;

always @(posedge CLOCK_50) begin
	 if(cx % 100) r2 <= r;
	 else r2 <= r2;
	 
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