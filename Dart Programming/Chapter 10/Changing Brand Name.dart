void main() {
  Car car1 = Car('Avante');
  Car car2 = Car('Grandeur');
  Car car3 = Car('Genesis');
  car1.changeBrand('Hyundai');

  
  car1.printCar();
  car2.printCar();
  car3.printCar();
  
  /* write your code here */
  car1.changeBrand('Kia');
  
  car1.printCar();
  car2.printCar();
  car3.printCar();
}

class Car {
  /* write your code here */
  String? name;
  static String? brand;
	/* write your code here */
  
  
  Car(this.name);
  
  void changeBrand(String name) => brand = name;
  
  void printCar() => print(
    'brand: $brand,\n'
    'name: $name,\n'
  );
}



