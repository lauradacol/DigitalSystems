def valid(p1_a, p1_b, p1_c, p2_a, p2_b, p2_c):
	
	invalid_play = 0
	if (p1_a == p1_b and p1_b == p1_c and p1_c == 0) or (p1_a == p1_b and p1_b == p1_c and p1_c == 1):
		invalid_play = 1
	
	return invalid_play	

def batalha(p1_a, p1_b, p1_c, p2_a, p2_b, p2_c):
		
	result = 0
		
	#código biluca
	entrada_binario = []
	entrada_binario.extend([p1_a,p1_b,p1_c])
		
	entrada_binario = ''.join(str(i) for i in entrada_binario)	
	saida_decimal = int(entrada_binario,2)
	
	if saida_decimal+3<=6:
		saida_decimal = saida_decimal+3
	
	else:
		saida_decimal = (saida_decimal+3)-6
	
	saida_binario = bin(saida_decimal)[2:].zfill(3)
	
	decod_a = int(saida_binario[0])
	decod_b = int(saida_binario[1])
	decod_c = int(saida_binario[2])
	
	#jogada
	if (decod_a == p2_a and decod_b == p2_b and decod_c == p2_c):
		result = 1
	
	return result
			

for i in range(0,2):
	for j in range(0,2):
		for k in range(0,2):
			p1_a = i
			p1_b = j
			p1_c = k
			p2_a = 1
			p2_b = 0
			p2_c = 1
			invalid_play = valid(p1_a, p1_b, p1_c, p2_a, p2_b, p2_c)
			result = batalha(p1_a, p1_b, p1_c, p2_a, p2_b, p2_c)	
			print("Jogador 1: %d, %d, %d Jogador 2: %d, %d, %d => Resultado: %d, Jogada Inválida: %d" % (p1_a, p1_b, p1_c, p2_a, p2_b, p2_c, result, invalid_play));
	
