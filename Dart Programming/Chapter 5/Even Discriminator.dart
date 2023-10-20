void main() {
  List l = [0, 1, 2, 3, 4];
  
  /* write your code here */
  for(var item in l){
    if(item % 2 == 0){
      print(item * 2);
    }else{print(item);}
  }
}


