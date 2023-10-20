void main() {
  checkLength(null);
}

void checkLength(list) {
  int len = 0;
  try{
    len = list.length;
    print('length: $len');
  } catch(e) {
    print('Error has occured');
  } finally {
    if (len > 0) {
      print('There are elements in the list');
    } else {
      print('Empty list');
    }
  }
}