#include <iostream>
#include <cmath>
using namespace std;


int main()
{
	int n,i;
	double volume,radius;
	double totalVolume=0.0;
	const double PI=3.14159;
	
	cout<<"Please enter the number of spheres"<<endl;
	cin>>n;
	
	for(i=0;i<n;i++)
	{
		do
		{
			cout<<"Please enter the radius"<<endl<<endl;
			cin>>radius;
			if(radius<0)
			{
				cout<<"Error!! enter a positive number"<<endl<<endl;
			}
		
	
		}while(radius<0);
		volume=(4.0/3.0) * PI * pow(radius, 3);
		
		totalVolume=volume+totalVolume;
		
	
	}
	cout<<"The final volume is "<<totalVolume<<endl;
	return 0;
	
}
