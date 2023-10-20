void main() {
  int n = 10;
  String star = '';
  
  /* write your code here */
  for(int i = 1; i <= n; i++){
    star += '*' * i;
    star += '\n';
  }
  
  print(star);
}


