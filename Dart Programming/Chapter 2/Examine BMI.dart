void main() {
  double height = 1.75; // cm
  int weight = 67; // kg
  
  double bmi = weight / (height * height);
  
  String isNormal = (bmi >= 18.5 || bmi <= 22.9) ? 'Normal weight' : 'Overweight';
  
  print('Weight: $weight kg\nHeight: ${height*100} cm');
  print('BMI: ${bmi.toStringAsFixed(2)}\n$isNormal');
}




