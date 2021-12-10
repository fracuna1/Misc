#include <iostream>
#include <cmath>
using namespace std;


int sumoflargernumber(int array1[], int array2[], int N)
{	
	int i;
	int sum = 0;
	for(i=0; i<N;i++)
	{
		if(array1[i] > array2[i])
		{
			sum = sum + array1[i];
		}
		else
		{
			sum = sum + array2[i];
		}			
	}
	return sum;
}



int main()
{
	int result, result2;
	
	int a1[5] = {5,3,-4,6,10};
	int a2[5] = {4,4,9,6,4};
	result = sumoflarge(a1,a2, 5);
	cout << result << endl;
	cout << result2 << endl;
}

