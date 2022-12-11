

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lafyuu/Screens/LoginScreen/login_events.dart';
import 'package:lafyuu/Screens/LoginScreen/login_state.dart';
import 'package:lafyuu/Utils/validator.dart';

class LoginBloc extends Bloc<LoginEvents,LoginState>{

  LoginBloc() : super(Login_Initialstate()){

    on<Login_textchangeevent>((event, emit) => {
      if(EmailValid.validate(event.email)== false){
        emit(Email_errorstate('Please enter a valid email'))
      }else if (event.password.length < 8){
        emit(Pass_errorstate('Oops! Your Password Is Not Correct '))
      }else{
        emit(LogIn_validstate())
      }
    });

    on<Login_Submitted>((event, emit) => {
      emit(LogIn_loadingstate())
    });

  }




}