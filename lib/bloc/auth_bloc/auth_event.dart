abstract class AuthEvents {}


 

class AppStarted extends AuthEvents{}


class LoggedIn extends AuthEvents {
  final String token;
  LoggedIn({required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'Loggedin {$token}';
}

class LoggedOut extends AuthEvents{}