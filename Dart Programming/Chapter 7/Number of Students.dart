void main() {
  String className = 'Science';/* write your code here */
  int num = Student (className);/* write your code here */
  print('The number of students in $className class: $num');
}

/* write your code here */int Student (String className) {
  switch(className) {
    case 'Math' : {
      return 21;
    } 
    case 'Science' : {
      return 15;
    }
    default : {
      return 18;
    }
  }
}


