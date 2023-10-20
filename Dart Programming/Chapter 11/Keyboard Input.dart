void main() {
  ArrowKey arrowKey = ArrowKey(input: 'right');
  arrowKey.printInput();
}

abstract class Keyboard {
  String input;
  
  Keyboard({required this.input});
  
  void printInput() {
    print('input: $input');
  }
}

mixin RightArrow {
  void rightArrowPressed() {
    print('Pressed right arrow key');
  }
}

mixin LeftArrow {
  void leftArrowPressed() {
    print('Pressed left arrow key');
  }
}

mixin UpArrow {
  void upArrowPressed() {
    print('Pressed up arrow key');
  }
}

mixin DownArrow {
  void downArrowPressed() {
    print('Pressed down arrow key');
  }
}

class ArrowKey extends Keyboard with RightArrow, LeftArrow, UpArrow, DownArrow{
  
  ArrowKey({required String input}) : super(input: input) {
    if (input == 'right') {
      rightArrowPressed();
    } else if (input == 'left') {
      leftArrowPressed();
    } else if (input == 'up') {
      upArrowPressed();
    } else {
      downArrowPressed();
    }
  }
}


