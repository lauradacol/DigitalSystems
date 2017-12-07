/** Purpose: Calcular a área do triângulo.
 * Input: 6 inputs, correspondendo às coordenadas dos pontos a, b e c.
 * Output: area. Área do triangulo formado pelos pontos a, b e c.
 */
module triangleArea(
	input CLOCK_50,
	input [8:0]ax,
	input [8:0]ay,
	input [8:0]bx,
	input [8:0]by,	
	input [8:0]cx,
	input [8:0]cy,	
	output [17:0]area
);

//wire [0:20] l = 0;
//assign area = l; 

wire [17:0] a = (ax*by)+(ay*cx)+(bx*cy);
wire [17:0] b = (ay*bx)+(ax*cy)+(by*cx);
wire signed [17:0] r = a - b;

Mod M(r, area);

endmodule