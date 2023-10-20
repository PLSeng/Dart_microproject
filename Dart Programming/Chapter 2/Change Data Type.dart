void main() {
  String num = '100';
  int str = 1234;
  
	int newNum = int.parse(num);/* write your code here */
  newNum += newNum;
	String newStr = str.toString();/* write your code here */
  newStr += newStr;

	print(newNum);
  print(newStr);
}


