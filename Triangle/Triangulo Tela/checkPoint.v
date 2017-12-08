module checkPoint(
	input CLOCK_50,
	input [8:0]ax,
	input [8:0]ay,
	input [8:0]bx,
	input [8:0]by,	
	input [8:0]cx,
	input [8:0]cy,
	input [8:0]px,
	input [8:0]py,		
	output check
);		

reg l;
assign check = l; 
wire [17:0] triangle;
wire [17:0] t1;
wire [17:0] t2;
wire [17:0] t3;

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