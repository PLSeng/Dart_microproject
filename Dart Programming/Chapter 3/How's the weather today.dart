void main() {
  int temperature = 25;/* write your code here */
  
  print('Temperature: $temperature °C');

	String weather = "Default";

  /* write your code here */
  if(temperature < 10){
    weather = 'cold';
  }else if(temperature <= 25){
    weather = 'warm';
  }else{weather = 'hot';}

	print("It's $weather outside.");
}	




