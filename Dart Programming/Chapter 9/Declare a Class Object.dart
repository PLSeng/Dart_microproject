void main() {
  /* write your code here */
  m s1 = m('Aclass');
  s1.pt();
  String title = 'Aclass';/* write your code here */
  print('title: $title');
}

/* write your code here */
class m{
  String title = 'Aclass';
  
  m(String title){
    this.title = title;
  }
  void pt(){
    print('Instance of \'$title\' created');
  }
}


