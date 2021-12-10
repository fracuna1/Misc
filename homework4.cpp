//Felicia Acuna
//CSC240 Program3
//this program takes a value that is inserted by 
//the user and searches through the first array 
//for how many times it occurs, then it takes the 
//indexes and puts them into the second array and 
//prints out how many times the number occured.


#include <iostream>
using namespace std;

void arrayData(int numberArray[], int targetInt,
int resultsArray[],int size,int &matches);

void printArray(int printArray[], int size);

int main()
{
	int numberArray[7]={101,103,101,104,105,101,107};
	int resultsArray[7];
	int size = 7;
	int targetInt = 101;
	int matches = 0;
	
	arrayData(numberArray, targetInt, resultsArray, size, matches);
	cout << matches << endl;
	printArray(numberArray, size);
	printArray(resultsArray,7);
	
}





void arrayData(int numberArray[], int targetInt,
int resultsArray[],int size,int &matches)
{
	int i,j;
	j=0;

	for(i=0;i<size;i++)
	{
		if(numberArray[i]==targetInt)
		{
			resultsArray[j]=i;
			j++;
			matches++;
		}
	}
	//filling rest of the result array with -1
	for(j; j<size;j++){
		resultsArray[j]=-1;
	}
	
}

void printArray(int array[], int size){
	for(int i=0; i<size;i++){
		cout << array[i] << " ";
	}
	cout << endl;
}
