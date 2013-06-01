#include <iostream>
int main()
{
	long count = 0;
	for(int i = 0; i < 1000000; i++)
	{
		for(long j = 0; j < i; j++)
		{
			count+=1;
		}
	}
	std::cout << "COUNT: " << count << "\n";
	return 0;
}
