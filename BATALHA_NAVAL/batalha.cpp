#include <cstdio>
using namespace std;

void batalha(int p1_a, int p1_b, int p1_c, 
             int p2_a, int p2_b, int p2_c, 
		int * s1, int * s2)
{

	int e_a = p1_b;
	int e_b = p1_c;
	int e_c = p1_a;

	if ( (e_a == e_b && e_b 
	== e_c && e_a == 0) ||
	     (e_a == e_b && e_b 
	 == e_c && e_a == 1) ||
	     (p2_a == p2_b && p2_b 
	  == p2_c && p2_a == 0) ||
	     (p2_a == p2_b && p2_b 
	  == p2_c && p2_a == 1)
	   )
	{
		*s1 = 1;
		*s2 = 0;
	}
	else if (e_a == p2_a 
	      && e_b == p2_b 
	      && e_c == p2_c) {
		*s1 = 0;
		*s2 = 1;
	}
	else {
		*s1 = 0;
		*s2 = 0;
	}
}


int main() {
	int s1, s2;

	//batalha(0, 0, 0, 1, 1, 0, &s1, &s2);
	//printf("0, 0, 0, 1, 1, 0 resultado => %d %d\n", s1, s2);
	//batalha(1, 0, 1, 1, 0, 1, &s1, &s2);
	//printf("1, 0, 1, 1, 0, 1 resultado => %d %d\n", s1, s2);

	for (int k = 0; k <= 1; ++k) {
	  for (int l = 0; l <= 1; ++l) {
	    for (int m = 0; m <= 1; ++m) {
              batalha(k, l, m, 1, 0, 1, &s1, &s2);
	      printf("%d, %d, %d, 1, 0, 1 resultado => %d %d\n", k, l, m, s1, s2);
	    }
	  }
	}
}
