// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lafyuu/Screens/HomeScreen/home_screen.dart';
import 'package:lafyuu/Screens/LoginScreen/loginscreen.dart';
import 'package:lafyuu/Screens/SplashScreen/splashscreen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lafyuu/Screens/Tabbar/tabbar.dart';
import 'package:lafyuu/Utils/Services/state_services.dart';
import 'package:lafyuu/bloc/auth_bloc/auth_bloc.dart';
import 'package:lafyuu/bloc/auth_bloc/auth_event.dart';
import 'package:lafyuu/bloc/auth_bloc/auth_state.dart';

class SimpleBlocDelegate extends BlocDelegate{

  @override
  void onEvent(Bloc bloc, Object event){
    super.onEvent(bloc, event);
  }


  @override
  void onTransition(Bloc bloc, Transition transition){
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace){
    super.onError(bloc, error, stackTrace);
  }
}


void main() {
    BlocSupervisor.delegate = SimpleBlocDelegate();
    final StateService stateService = StateService();
    runApp(
      BlocProvider(create: (context){
        return AuthenticationBloc(stateService: stateService)..add(AppStarted());
      },
      child: MyApp(stateService: stateService,),
      )
      );
}


class MyApp extends StatelessWidget {

  final StateService stateService;
  const MyApp({Key key, @required this.stateService}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lafyuu',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthState>(builder: (context,state){
        if(state is Authenticated){
          return Tabbar();
        }
        if (state is UnAuthenticated){
          return LoginScreen(stateService: stateService);
        }
        if (state is AuthLoading){
          return const Scaffold(
              body: CircularProgressIndicator(),
          );
        }
        return const Scaffold(
              body: CircularProgressIndicator(),
          );
      } ,)
    );
  }
}

