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
	
	for i in range(0, 3):
		if i+3<=6:
			jogada_decodificada.insert(i+3,jogador_a[i])
		else:
			jogada_decodificada.insert(((i+3)-n), jogador_a[i])	
	
	print(jogada_decodificada)
	return jogada_decodificada

jogador_a = codigo_biluca(jogada())
jogador_b = jogada()

resultado = 0


while resultado == 0:
	
	if jogador_a == jogador_b:
		print("Você acertou")
		resultado = 1

	else: 
		print("Você errou, tente novamente")
		jogador_b = jogada()
	
