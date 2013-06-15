#include <iostream>
#include <cmath>
#include <pari/pari.h>


long fibRecur(long n)
{
	if(cmpii(fibo(n),powuu(10,999)) == 1){
		return n;
	}else{
		return fibRecur(n+1);
	}
}

int main(int argc, const char * argv[])
{
	pari_init(8000000,2);
	long fib = fibRecur(1);
	std::cout << fib << "\n";
}
