

module batalha(
	input p1_a,
	input p1_b,
	input p1_c,
	input p2_a,
	input p2_b,
	input p2_c,
	output s1,
	output s2);


reg s2_r;

assign s2 = s2_r & ~s1;

wire e_a;
wire e_b;
wire e_c;

assign e_a = p1_b;
assign e_b = p1_c;
assign e_c = p1_a;

assign s1 = (p1_a == p1_b) & (p1_b == p1_c);

always @(e_a, e_b, e_c, p2_a, p2_b, p2_c) 
begin
	s2_r <= (e_a == p2_a) & (e_b == p2_b) & (e_c == p2_c);

end

endmodule


module test;

reg p1_a, p1_b, p1_c, p2_a, p2_b, p2_c;
wire s1, s2;

batalha B(p1_a, p1_b, p1_c, p2_a, p2_b, p2_c, s1, s2);


initial begin
	$dumpvars(0, B);
	#2;
	p1_a <= 0; p1_b <= 0; p1_c <= 0; p2_a <= 0; p2_b <= 0; p2_c <= 0;
	#2;
	p1_a <= 1; p1_b <= 1; p1_c <= 0; p2_a <= 1; p2_b <= 0; p2_c <= 1;
	#2;
end

endmodule
