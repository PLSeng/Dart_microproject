enum Login {email, anonymous, error}

void main() {
  Login loginWith = Login.anonymous;
  User user = User();
  
  if (loginWith == Login.email) {
    user = User(name: 'kevin', email: 'abc@abc.com', password: 'qwer1234');/* write your code here */
  } else if (loginWith == Login.anonymous) {
    user = User();/* write your code here */
  } else {
    return;
  }
  
  user.printUser();
}

class User {
  String name;
  String email;
  String password;
  
  User({this.name = 'Anonymous', this.email = 'none', this.password = 'none'});
  
  void printUser() {
    print(
      'name: $name,\n'
      'email: $email,\n'
      'password: $password,\n'
    );
  }
}