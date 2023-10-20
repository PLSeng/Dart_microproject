void main() {
  List l = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  int n = 4;
  
  /* write your code here */
  for(int i in l){
    if(l[i] % n == 0){
      l[i] *= 2;
    }
  }
  print('n is $n');
  print(l);
}


