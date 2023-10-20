void main() {
  int math = 90;/* write your code here */
  int history = 80;/* write your code here */
  int physics = 90;/* write your code here */
  
  double avg = ((math+history+physics)/3).roundToDouble(); // avg = 87
  
  print("Peter's average score : $avg");
  
  String grade = "Default";
  
  /* write your code here */
  if(avg >= 90){
    grade = 'A';
  }else if(avg >= 80){
    grade = 'B';
  }else if(avg >= 70){
    grade = 'C';
  }else if(avg >= 60){
    grade = 'D';
  }else{
    grade = 'F';
  }
  
  print("Peter's Grade : " + grade);
}


