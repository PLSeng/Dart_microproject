void main() {
  var list = ['Elephant', 'Giraffe', 'Lion', 'Cheetah', 'Ostrich'];
  
  list.forEach((String i) => zoo(i));
}

void zoo(String animal) {
  switch(animal) {
    case 'Elephant' : {
      print('$animal in the room');
    } break;
    case 'Giraffe' : {
      print('$animal eating fruits');
    } break;
    case 'Lion' : {
      print( '$animal in the bathtub');
    } break;
    case 'Cheetah' : {
      print('$animal racing with a turtle');
    } break;
    case 'Ostrich' : {
      print( '$animal climbing a tree');
    } break;
    default : {
      print('$animal being $animal');
    } break;
  }
}


