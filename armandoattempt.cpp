#include <iostream>
#include <cmath>
using namespace std;


void Introduction()
{
	cout<<"Welcome to the compute Ring Volume program."<<endl;
	cout<<"The rules are that the raduis's must be "
	<<endl<<"in inches and they must be positive values."<<endl<<endl;
}


void RadiusInputs(double &ringRadius, double &crossRadius)
{
	do
	{
		cout<<"Please enter the ring radius: "<<endl;
		cin>>ringRadius;
		
		if(ringRadius<0)
		{
			cout<<"Error enter correct value!"<<endl<<endl;
		}
		
	}
	while(ringRadius<0);
	
	do
	{
		cout<<"Please enter the cross section radius"""<<endl;
		cin>>crossRadius;
		if(crossRadius<0)
		{
			cout<<"Error enter correct value!"<<endl<<endl;
		}
		
	}
	while(crossRadius<0);
	
}


 double VolumeCalculations(double ringRadius, double crossRadius)
{
	double volume;
	const double PI=3.14159;
	
	volume=2*pow(PI, 2)*ringRadius*pow(crossRadius, 2);
	return volume;
	

	
}


void VolumeDisplay(double finalVolume)
{
	cout<<"The volume of the ring is: "
	<<finalVolume <<" inch's"<<endl;
}	





int main()
{
	double ringRadius, crossRadius, finalVolume;
	Introduction();
	RadiusInputs(ringRadius, crossRadius);
	finalVolume = VolumeCalculations(ringRadius,crossRadius);
  	VolumeDisplay(finalVolume);

}

