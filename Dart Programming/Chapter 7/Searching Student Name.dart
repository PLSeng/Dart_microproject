void main() {
  String name = 'abc@gmail.com';
  name = abc(name);/* write your code here */;
	print(name);
}

/* write your code here */String abc (String email) {
	Map studentMap = {
		'qwe@gmail.com': 'Peter',
		'zxc@gmail.com': 'John',
		'abc@gmail.com': 'Alex',
	};
	
  return studentMap[email];/* write your code here */
}


