// ignore_for_file: camel_case_types
abstract class LoginState {}

class LoginInitial extends LoginState{}


class LogIn_validstate extends LoginState {}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure {$error}';

}



class Login_successstate extends LoginState{}

class Login_failedstate extends LoginState{}

class LoginLoading extends LoginState{}