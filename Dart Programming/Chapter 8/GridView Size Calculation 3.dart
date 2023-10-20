void main() {
   var size = gridViewCalculates(8,9);
   print('GridView Size is $size');
}

double gridViewCalculates (int leftRatio, int rightRatio , {int widthOfTheEntireGrid = 30}) => widthOfTheEntireGrid - 16 - 16 / 2 * rightRatio / leftRatio;
  /* write your code here */


