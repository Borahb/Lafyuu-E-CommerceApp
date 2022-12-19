// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lafyuu/bloc/auth_bloc/loginbloc/login_bloc.dart';
import 'package:lafyuu/Screens/LoginScreen/loginform.dart';
import 'package:lafyuu/Utils/Services/state_services.dart';
import 'package:lafyuu/bloc/auth_bloc/auth_bloc.dart';


class LoginScreen extends StatelessWidget {
  final StateService stateService;
  const LoginScreen({Key? key, required this.stateService}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(create: (context){
        return LoginBloc(stateService: stateService, authenticationBloc: BlocProvider.of<AuthenticationBloc>(context) );
      },
      child: LoginForm(stateService:stateService),
      )
      );
  }
}
