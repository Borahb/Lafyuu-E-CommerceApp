
// ignore_for_file: camel_case_types
abstract class LoginEvents {}


class Login_textchangeevent extends LoginEvents{
  String email;
  String password;
  Login_textchangeevent(this.email, this.password);
}


class Login_Submitted extends LoginEvents{
  String email;
  String password;
  Login_Submitted({required this.email,required this.password});

  @override
  List<Object> get props =>[email,password];

  @override
  String toString() => 'LoginSubmitted {email: $email, password : $password}';
}

