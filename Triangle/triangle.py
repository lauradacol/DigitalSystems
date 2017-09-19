import os
import math


def triangleArea(a,b,c):
	A = (a[0]*b[1]*1)+(a[1]*1*c[0])+(1*b[0]*c[1])
	B = (a[1]*b[0]*1)+(a[0]*1*c[1])+(1*b[1]*c[0])
	return abs(A-B)

def checkPoint(a,b,c,p):
	triangle = triangleArea(a,b,c)
	
	t1 = triangleArea(a,b,p)
	t2 = triangleArea(a,c,p)
	t3 = triangleArea(b,c,p)
		
	if (t1+t2+t3)<=triangle:
		return True
		
	else:
		return False
	
def drawTriangle(a,b,c):
	rows, columns = os.popen('stty size', 'r').read().split()
	
	for i in range(1, int(rows)):
		for j in range(1,int(columns)):
			p = [i,j]
			
			if checkPoint(a,b,c,p) == True:
				if(a[0]==i and a[1]==j) or (b[0]==i and b[1]==j) or (c[0]==i and c[1]==j):
					print("X", end='')
					
				else:
					print("*", end='')
				
			else:
				print("-", end='')
		print("")

os.system('clear')

a = [5,5]
b = [15,25]
c = [3,50]

drawTriangle(a,b,c)

p=[50,50]
print(checkPoint(a,b,c,p))


