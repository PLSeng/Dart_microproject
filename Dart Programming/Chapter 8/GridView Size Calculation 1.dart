void main() {
  var size = gridViewCalculates(leftRatio: 8, rightRatio: 9);
  print('GridView Size is $size');
}

double gridViewCalculates({double leftRatio = 1, double rightRatio = 1}) {
  double gridViewSize;
  double widthOfTheEntireGrid = 30;
    
  gridViewSize = widthOfTheEntireGrid - 16 - 16 / 2 * rightRatio / leftRatio;
  return gridViewSize; 

}


