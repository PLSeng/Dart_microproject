void main() {
  Rectangle rec = Rectangle(25,10)/* write your code here */;
  int area = rec.area()/* write your code here */;
  int perimeter = rec.perimeter()/* write your code here */;
  
  print('area: $area');
  print('perimeter: $perimeter');
}

class Rectangle {
  /* write your code here */
  int width;
  int length;
  
  Rectangle(this.width,this.length);
  
  int area(){
    return width * length;
  }
  
  int perimeter(){
    return 2 * (width + length);
  }
  

}


