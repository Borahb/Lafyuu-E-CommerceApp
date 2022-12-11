abstract class LoginState {}

class Login_Initialstate extends LoginState{}


class LogIn_Invalidstate extends LoginState {}


class LogIn_validstate extends LoginState {

}

class LogIn_errorstate extends LoginState{}

class Email_errorstate extends LogIn_errorstate{
 String msg;
 Email_errorstate(this.msg);

}

class Pass_errorstate extends LogIn_errorstate{
  String msg;
  Pass_errorstate(this.msg);

}


// class LogIn_errorstate extends LoginState {
//   String errormsg;
//   LogIn_errorstate(this.errormsg);
// }


class LogIn_loadingstate extends LoginState{}