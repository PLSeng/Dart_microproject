enum AuthStatus {login, logout, error}

void main() {
  AuthStatus status = AuthStatus.login;
  User user = User();
  
  print('before: ${user.name()}');
  
  if (status == AuthStatus.login) {
    /* write your code here */
    user.setName('Peter');
  } else {
    print('You must login first!');
  }
  
  print('after: ${user.name()}');
}

class User {
  String _name = 'none';
  
  User();
  
  /* write your code here */
  void setName(String name){
    _name = name;
  }
	/* write your code here */
  String? name(){
    return _name;
  }
}


