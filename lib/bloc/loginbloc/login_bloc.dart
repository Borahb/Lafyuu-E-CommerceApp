
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lafyuu/Utils/Services/state_services.dart';
import 'package:lafyuu/Utils/Services/validator.dart';
import 'package:lafyuu/bloc/auth_bloc/auth_bloc.dart';
import 'package:lafyuu/bloc/auth_bloc/auth_event.dart';
import 'package:lafyuu/bloc/loginbloc/login_events.dart';
import 'package:lafyuu/bloc/loginbloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvents,LoginState>{

  final StateService stateService;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({required this.stateService,required this.authenticationBloc,
  });

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvents event) async* {
    if (event is Login_Submitted) {
      yield LoginLoading();

      try {
        final token = await stateService.login(
          event.email,
          event.password,
        );
        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }



  

  // LoginBloc() : super(Login_Initialstate()){

  //   on<Login_textchangeevent>((event, emit) => {
  //     if(EmailValid.validate(event.email)){
  //       emit(Email_errorstate('Please enter a valid email'))
  //     }else if (event.password.length < 5){
  //       emit(Pass_errorstate('Oops! Your Password Is Not Correct '))
  //     }else{
  //       emit(LogIn_validstate())
  //     }
  //   });

  //   on<Login_Submitted>((event, emit) => {  
  //   });

  




}