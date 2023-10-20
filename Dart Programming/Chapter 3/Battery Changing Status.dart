void main(){

	int batteryLevel = 100;
  print("Battery : $batteryLevel%");
  
  String printString = "Battery charging";
  
	/* write your code here */
  if(batteryLevel == 100){
    printString += ' complete';
  }
  
  print(printString);
}


