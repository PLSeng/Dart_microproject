void main() {
  Map grocery = {
    'Orange': 10,
    'Pineapple': 50,
    'Banana': 30
  };

  /* write your code here */
  grocery['Banana'] = 40;
  print(grocery);
  Map grocerie = {'Grape': 40};
  grocery.addAll(grocerie);
  print(grocery);
  grocery.remove('Orange');
  
	print({...grocery});
}


