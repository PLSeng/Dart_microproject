enum LoginState{login,logout,error}

void main() {
  LoginState isLogin = LoginState.logout;/* write your code here */
  
  checkLoginState(isLogin);
}

void checkLoginState(state) {
  switch(state) {
    case LoginState.login : {
      print('Redirecting to home screen');
    } break;
    case LoginState.logout : {
      print('Redirecting to login screen');
    } break;
    default : {
      print('Problem has occured... please talk to the manager');
    } break;
  }
}


