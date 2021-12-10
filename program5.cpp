//Felicia Acuna
//CSC240 
//Program5 phase2
//this program takes the users inputs and encodes or decodes the inputs then it returns the new encoded/decoded text


#include <iostream>
using namespace std;

void Encode(int choice, char input[], int shift, char result[]);
void Decode(int choice, char input[], int shift, char result[]);

int main()
{
	char input[81];
	char result[81];
	int choice,shift;
	char repeat;
	

	do
	{
		cout<<"Welcome to the encode/decode program"<<endl;
		cout<<endl;
		
		do{
			cout<<"Would you like to encode or decode"
			<<"(enter 1 for encode and 2 for decode)"<<endl;
			cin>>choice;
			cout<<endl;
			if(choice != 1 && choice != 2)
			{
				cout<<"Error enter the correct value"<<endl;
			}
			
			if(choice == 1)
			{
				cout<<"Starting the encoding process..."<<endl;
			}
			
			if(choice == 2)
			{
				cout<<"Starting the decoding process..."<<endl;
			}
			cout<<endl;
		}while(choice != 1 && choice != 2);
		
		
		cout<<"Please enter the text:"<<endl;
		cin>>input;
		cout<<endl;
		cout<<"Please enter the shift N (from 1 to 25)"<<endl;
		cin>>shift;
		cout<<endl;
		
		if(choice==1)
		{
		 Encode(choice,input,shift,result);
		}
		else if(choice==2)
		{
		 Decode(choice,input,shift,result);
		}
		else
		{
			cout<<"Error enter the correct value"<<endl;
		}
		
		cout<<"would you like to run the program again?"
		<<" (enter y for yes and n for no)"<<endl;
		cin>>repeat;
		cout<<endl;
		
	}while(repeat=='y');
}

void Encode(int choice,char input[], int shift,char result[])
{
	int answer;
	
	for(int ix=0;ix<81;ix++)
	{
		answer=input[ix]+shift;
		result[ix]=answer;
		cout<<result[ix]<< ' ';
	}
	cout <<endl << endl;
}

void Decode(int choice,char input[], int shift,char result[])
{
	int answer;
	
	for(int ix=0;ix<81;ix++)
	{
		answer=input[ix]-shift;
		result[ix]=answer;
		cout<<result[ix]<< ' ';
	}
	cout <<endl << endl;
}
