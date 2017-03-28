numero_entradas = int(input())

entradas = []

for i in range(0,numero_entradas):
	entradas.append(input())
	
numero_linhas = (2)**numero_entradas

valor_inicial = 0


for i in range(0,numero_linhas):
	print("#2 ", end='')
	numero_binario = ((bin(valor_inicial)[2:].zfill(numero_entradas)))
	
	count=0
	for j in numero_binario:
		
		print("%s <= %s; " % (entradas[count], j), end='')
		count+=1
	
	print("")
	valor_inicial+=1
	
