void main() {
  
  // Price of fruits you are buying
  int avocado = 60;/* write your code here */
  int pineapple = 150;/* write your code here */
  int mango = 100;/* write your code here */
  int pomegranate = 130;/* write your code here */
  int lime = 70;/* write your code here */
  
  int totalPrice = avocado + pineapple + mango + pomegranate + lime; // Total = $510
  
  print("The total price of fruits : \$$totalPrice");
  
  double discountedPrice = 0;
  double finalPrice = 0;
  
  /* write your code here */
  if(totalPrice >= 1000){
    discountedPrice = totalPrice.toDouble() * 0.2;
  }else if(totalPrice >= 500){
    discountedPrice = totalPrice.toDouble() * 0.1;
  }else if(totalPrice >= 10){
    discountedPrice = totalPrice.toDouble() * 0.05;
  }
  
  finalPrice = totalPrice.toDouble() - discountedPrice;
  
  print("The discounted price is \$$discountedPrice.");
  print("You have to pay \$$finalPrice.");
}


