// ignore_for_file: import_of_legacy_library_into_null_safe
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lafyuu/Screens/LoginScreen/loginscreen.dart';
import 'package:lafyuu/Utils/Services/state_services.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/bloc/auth_bloc/auth_bloc.dart';
import 'package:lafyuu/bloc/loginbloc/login_bloc.dart';

class SplashScreen extends StatefulWidget {
  final StateService stateService;

  const SplashScreen({Key? key, required this.stateService}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => LoginBloc(stateService: widget.stateService, authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)
                    ),
                    child: LoginScreen(stateService: widget.stateService),
                  )));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppColors colors = AppColors();

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: colors.backgroundcolor,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Image.asset('images/single icon White.jpg',
                      height: 72, width: 72))
            ]),
      ),
    );
  }
}
