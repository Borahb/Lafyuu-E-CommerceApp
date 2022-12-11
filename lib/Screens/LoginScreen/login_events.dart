abstract class LoginEvents {}


class Login_textchangeevent extends LoginEvents{
  String email;
  String password;
  Login_textchangeevent(this.email, this.password);
}


class Login_Submitted extends LoginEvents{
  String email;
  String password;
  Login_Submitted(this.email, this.password);
}