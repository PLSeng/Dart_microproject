void main() {
	int n = 4;

  int fac = 1;
  print('n is $n');
  
	/* write your code here */
  while(n > 0){
    fac *= n;
    n--;
  }
  
  print('n factorial: $fac');

}


