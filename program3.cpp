//Felicia Acuna
//CSC240 Program3
//


#include <iostream>
using namespace std;

double optionA(double initialBalance,double annualInterestRate,double annualCharge,double threshold, int years, int tableOption);
double optionB(double initialBalance,double annualInterestRate,double annualCharge,double threshold, int balanceGoal, int tableOption);

int main()
{
	double annualCharge,threshold;
	double initialBalance, annualInterestRate;
	int option,years,balanceGoal, repeat;
	int tableOption;
	double finalBalance;
	int finalYear;
	
	do
	{
		cout<<"Welcome to the growth prediction program."<<endl;
		cout<<endl;
		
		do{
			cout<<"Please enter annual processing charge"
			<<" as a dollar value, ex 99.99:"<<endl;
			cin>>annualCharge;
			if(annualCharge < 0)
			{
				cout << "Please enter a non-negative value." << endl;
			}
		}while(annualCharge<0);
		
		do
		{
			cout<<"Please enter the bank's threshold"
			<<" as a dollar value, ex 99.99:"<<endl;
			cin>>threshold;
			cout<<endl;
			
			if(threshold < 0)
			{
				cout << "Please enter a non-negative value." << endl;
			}					
		}while(threshold<0);
	
		do
		{
		cout<<"What is the initial account balance?"
		<<" (enter the balance as a dollar value, ex 99.99)"<<endl;
		cin>>initialBalance;
		cout<<endl;
		
			if(initialBalance < 0)
			{
				cout << "Please enter a non-negative value." << endl;
			}					
		}while(initialBalance<0);
				
		do
		{
		cout<<"What is the annual interest rate?"
		<<" (enter the interest rate as a percentage, ex. 5.1)"<<endl;
		cin>>annualInterestRate;
		cout<<endl;
		
			if(annualInterestRate < 0)
			{
				cout << "Please enter a non-negative value." << endl;
			}					
		}while(annualInterestRate<0);
		

		cout<<"Would you like to choose option A: "<<endl
		<<"This will give the final account balance."<<endl
		<<endl
		<<"Or would you like to choose option B: "<<endl
		<<"This will take your financial goal and "<<endl 
		<<"calculate how many years it will take "<<endl 
		<<"to reach the goal"<<endl;
		cout<<endl;
		cout<<"Please enter numbers 1 for option A "
		<<"and 2 for option B:"<<endl;
		do
		{	
			cin>>option;
			
			if(option == 1)
			{
				do
				{
					cout<<"Please specify the length of the investment"
					<<"in years (as an integer, ex 5)"<<endl;
					cin>>years;
					cout<<endl;
					
					if(years < 0)
					{
						cout<<"Please enter non-negative time." << endl;
					}
				}while(years < 0);
				
				cout<<"Would you like a table describing the account"
				 <<"balance at the end of each period?"
				<< "(1 for yes, 0 for no)"<<endl;
				cin>>tableOption;
				cout<<endl;
				
				finalBalance = optionA(initialBalance, annualInterestRate,
				 annualCharge, threshold, years, tableOption);
				cout<< "The final balance is ";
				cout<< finalBalance << endl;
				cout << "Would you like to do another calculation?"
				<< "(1 for yes, 0 for no)" <<endl;
				cin>> repeat;
				cout<<endl;
			}
			else if(option == 2)
			{
				do
				{
					cout<<"Input the goal for the account balance"
					<<" (as a dollar value, ex 99.99)"<<endl;
					cin>>balanceGoal;
					cout<<endl;
					
					if(balanceGoal<0)
					{
						cout<<"Please enter a non-negative value"<<endl;
					}	
				}while(balanceGoal < 0);

				cout<<"Would you like a table describing the"
				<<" account balance at the end of each period?"
				<< "(1 for yes, 0 for no)" <<endl;
				cin>>tableOption;
				cout<<endl;
				
				finalYear = optionB(initialBalance, annualInterestRate, 
				annualCharge, threshold, balanceGoal, tableOption);
				cout<< "It will take " << finalYear
				 << " years to reach your goal of " << balanceGoal<<".";
				cout<<endl<<endl;
				cout << "Would you like to do another calculation?"
				<< "(1 for yes, 0 for no)" <<endl;
				cin>> repeat;
				cout<<endl;
			}
			else
			{
					cout<<"Error, please enter the correct value"<<endl;
			}
		}while(option!= 1 && option != 2);
		
	}while(repeat == 1);
	cout<< "Exiting program...";
}

double optionA(double initialBalance,double annualInterestRate,
double annualCharge,double threshold, int years, int tableOption)
{
	double interest,newBalance;
	
	newBalance = initialBalance;
	
	if(tableOption == 1)
	{
		cout<< "Year \t Balance"<<endl;
		cout << 0 << "\t" << initialBalance << endl;
	}
	
	for(int i=0; i<years;i++)
	{
		interest=newBalance*annualInterestRate/100.0;
		newBalance=newBalance+interest;
		
		if(newBalance < threshold)
		{
			newBalance = newBalance - annualCharge;
		}
		if(tableOption == 1)
		{
			cout << (i+1) << "\t" << newBalance << endl;
		}
	}
	return newBalance;
}

double optionB(double initialBalance,double annualInterestRate,
double annualCharge,double threshold, int balanceGoal, int tableOption)
{
	double newBalance;
	double interest;
	int finalYear;
	
	newBalance = initialBalance;
	
	if(tableOption == 1)
	{
		cout<< "Year \t Balance"<<endl;
		cout << 0 << "\t" << initialBalance << endl;
	}
	
	while(newBalance < balanceGoal)
	{
		interest=newBalance*annualInterestRate/100.0;
		newBalance=newBalance+interest;
		
		if(newBalance < threshold)
		{
			newBalance = newBalance - annualCharge;
		}
		finalYear++;
		if(tableOption == 1)
		{
			cout << finalYear << "\t" << newBalance << endl;
		}
	}
	return finalYear;
}


