void main() {

  var anonymousList = ['Hello', 'World'
  ];
  
  var anonymousMap = {
    "name": 'James'/* write your code here */,
    "age": '28'/* write your code here */ 
  };
  
  for(int i=0; i<anonymousList.length; i++) {
    /* write your code here */
    print(anonymousList[i]);
  }
  
  anonymousMap.forEach((key, value) => print(value)/* write your code here */);
}


