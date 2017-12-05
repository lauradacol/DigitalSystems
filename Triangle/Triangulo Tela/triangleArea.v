/** Purpose: Calcular a área do triângulo.
 * Input: 6 inputs, correspondendo às coordenadas dos pontos a, b e c.
 * Output: area. Área do triangulo formado pelos pontos a, b e c.
 */
module triangleArea(
	input CLOCK_50,
	input [0:10]ax,
	input [0:10]ay,
	input [0:10]bx,
	input [0:10]by,	
	input [0:10]cx,
	input [0:10]cy,	
	output [0:20]area
);

reg [0:20] l = 0;
assign area = l; 
wire [0:20] a = (ax*by)+(ay*cx)+(bx*cy);
wire [0:20] b = (ay*bx)+(ax*cy)+(by*cx);
wire signed [0:20] r = a - b;
 
/*Sempre que o valor de alguma coordenada mudar, recalcular*/
always @(ax or ay or bx or by or cx or cy) begin
	/*Calcula fazendo o determinante da matriz, atribui o resultado a l que 
	está amarrado no output area*/
	//l = $abs(r);
	Mod M(r, l);
end
	
endmodule