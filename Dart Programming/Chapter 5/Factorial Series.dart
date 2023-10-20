void main() {
	List l = [];
  int n = 5;
  int sum = 1;
  
	/* write your code here */
  for(int i = 1; i <= n; i++){
    sum *= i;
    l.add(sum);
  }
  
  print(l);
}



