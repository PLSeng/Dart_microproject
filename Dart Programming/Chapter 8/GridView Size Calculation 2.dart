void main() {
  var size = gridViewCalculates(9,8);/* write your code here */
  print('GridView Size is $size');
}

double gridViewCalculates (double rightRatio, double leftRatio, {double widthOfTheEntireGrid = 30}) {
  double gridViewSize;
  gridViewSize = widthOfTheEntireGrid - 16 - 16 / 2 * rightRatio / leftRatio;
  return gridViewSize; 

}


