void main() {
  CustomList list1 = CustomList.one();
  CustomList list2 = CustomList.two(4);
  CustomList list3 = CustomList.three(5);
  
  list1.printList();
  list2.printList();
  list3.printList();
}

class CustomList {
  var list = [];
  
  CustomList.one() {
    list = [];
  }
  
  CustomList.two(int length) {
    for(int i = 0; i <= length; i++) {
      list.add(i);
    }
  }
  
  CustomList.three(int length) {
    for(int i = 0; i < length; i++) {
      list.add(false);
    }
  }
  
  void printList() {
    print(list);
  }
}


