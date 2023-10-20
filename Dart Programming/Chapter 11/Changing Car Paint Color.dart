void main() {
  Sedan grandeur = Sedan();
  SUV palisade = SUV();
  
  print('grandeur: ${grandeur.color}, palisade: ${palisade.color}');
  palisade.changeColor();
  grandeur.changeColor();
  print('grandeur: ${grandeur.color}, palisade: ${palisade.color}');
}

abstract class Car {
  String color = 'black';
  
  void changeColor() {
    color = 'grey';
  }
}

class Sedan extends Car {
  @override
  void changeColor() {
    color = 'blue';
  }
}


class SUV extends Car {}