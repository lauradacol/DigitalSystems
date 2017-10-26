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
 
/*Sempre que o valor de alguma coordenada mudar, recalcular*/

always @(ax or ay or bx or by or cx or cy) begin
	/*Calcula fazendo o determinante da matriz, atribui o resultado a l que 
	está amarrado no output area*/
	l = ((ax*by)+(ay*cx)+(bx*cy)) - ((ay*bx)+(ax*cy)+(by*cx));
end
	
endmodule

/** Purpose: checar se um ponto está dentro de um triângulo.
 * Input: 8 inputs, correspondendo às coordenadas dos vértices do triângulo 
 * (a, b e c) e ao ponto p. 
 * Output: check. 1 se o ponto p pertence ao triangulo formado pelos pontos
 * a, b e c. 0 se não pertence.
 */	 
module checkPoint(
	input CLOCK_50,
	input [0:10]ax,
	input [0:10]ay,
	input [0:10]bx,
	input [0:10]by,	
	input [0:10]cx,
	input [0:10]cy,
	input [0:10]px,
	input [0:10]py,		
	output check
);		

reg l;
assign check = l; 
wire [0:20] triangle;
wire [0:20] t1;
wire [0:20] t2;
wire [0:20] t3;

/*Calcula a área do triangulo formado pelos pontos a, b e c e atribui à
variável triangle*/
triangleArea triangle1(CLOCK_50, ax,ay,bx,by,cx,cy, triangle);

/*Calcula a área dos subtriangulos formados com o ponto p e atribui às 
variáveis t1, t2 e t3*/
triangleArea t_1(CLOCK_50, ax,ay,bx,by,px,py, t1);
triangleArea t_2(CLOCK_50, ax,ay,cx,cy,px,py, t2);
triangleArea t_3(CLOCK_50, bx,by,cx,cy,px,py, t3);

/*Sempre que triangle, t1, t2 ou t3 mudarem.*/
always @(triangle or t1 or t2 or t3) begin
	
	/*Se a área dos subtriangulos for menor ou igual ao triangulo, l = 1*/
	if((t1+t2+t3) <= triangle) begin
		l = 1;
	end

	else begin
		l = 0;
	end
end

endmodule
