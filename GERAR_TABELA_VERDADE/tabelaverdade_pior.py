nome_entradas = []
zero_um = []
lista_bits = []

print("Digite as entradas desejadas. Quando terminar, digite fim")
entrada = input()
bits = 1

while entrada != 'fim':
	nome_entradas.append(entrada)
	zero_um.append(0)
	lista_bits.append(bits)
	
	entrada = input()
	bits = bits + bits

count = 1

for j in range(0, (lista_bits[-1]*2)):
	print("#2 ", end='')
	for i in range(0, len(nome_entradas)):

		print("%s <= %d; " % (nome_entradas[i], zero_um[i]), end='')

		if (count % lista_bits[i]==0):
			zero_um[i] = 1 - zero_um[i]

	count+=1	
	print(" ")
	

