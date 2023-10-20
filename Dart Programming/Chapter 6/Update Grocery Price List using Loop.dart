void main() {
  Map grocery = {
    'Orange': 10,
    'Pineapple': 50,
    'Banana': 30,
    'Grape': 40,
  };

  print({...grocery});

	/* write your code here */
  grocery.forEach((k,v) => {grocery[k] = v * 1.2});

	print({...grocery});
}


