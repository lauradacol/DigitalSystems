def entradas():
	
	entradas = []
	
	ja = int(input())
	entradas.append(ja)
	
	jb = int(input())
	entradas.append(jb)
	
	jc = int(input())
	entradas.append(jc)
	
	return entradas


def testa_validade(jogada):
	if jogada == [0,0,0] or jogada == [1,1,1]:
		print("Jogada Inválida")
		print("Tente novamente")
		
		retorno = 0

	else:
		print("Jogada Válida")
		retorno = 1
	
	return retorno


def jogada():
	jogada = 0
	
	while jogada == 0:
		entrada = entradas()
		
		valido = testa_validade(entrada)
		if valido == 1:
			break
				
	return entrada	

def codigo_biluca(jogador_a):
	jogada_decodificada = []
	
	entrada_binario = ''.join(str(i) for i in jogador_a)
	entrada_decimal = int(entrada_binario,2)
	
	if entrada_decimal+3<=6:
		saida_decimal = entrada_decimal+3
	
	else:
		saida_decimal = (entrada_decimal+3)-6
	
	saida_binario = bin(saida_decimal)[2:].zfill(3)
		
	lista_decodificada = []
	for i in saida_binario:
		lista_decodificada.append(i)
	
#	print(lista_decodificada)	
	return lista_decodificada

jogador_a = codigo_biluca(jogada())
print(jogador_a)

jogador_b = jogada()
print(jogador_b)

resultado = 0

while resultado == 0:
	
	if jogador_a == jogador_b:
		print("Você acertou")
		resultado = 1

	else: 
		print("Você errou, tente novamente")
		jogador_b = jogada()
	
