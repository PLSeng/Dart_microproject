void main() {
  double bmi = 23.6;/* write your code here */
  print("BMI : $bmi");
  
  String printString = "Default";
  
  /* write your code here */
  if(bmi >= 18.5 && bmi <= 22.9){
    printString = 'Healthy';
  }else{
    printString = 'Unhealthy';
  }
  
  print(printString);
}


