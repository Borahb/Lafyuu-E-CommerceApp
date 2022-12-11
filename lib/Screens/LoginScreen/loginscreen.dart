import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lafyuu/Screens/LoginScreen/login_bloc.dart';
import 'package:lafyuu/Screens/LoginScreen/login_events.dart';
import 'package:lafyuu/Screens/LoginScreen/login_state.dart';
import 'package:lafyuu/Screens/SignUpScreen/signup_bloc.dart';
import 'package:lafyuu/Screens/SignUpScreen/signupscreen.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/Utils/resubalebutton1.dart';
import 'package:lafyuu/Utils/reusable_texfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AppColors colors = AppColors();
    late Color iconcolor;
    late Color bordercolor;
    FocusNode emailf1 = FocusNode() ;
    FocusNode passf2 = FocusNode () ;

    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 112),
                child: Image.asset('images/Icon.jpg', height: 72, width: 72),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Welcome to Lafyuu',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Sign in to continue',
                  style: TextStyle(color: colors.textcolor1, fontSize: 12),
                ),
              ),

              Container(height: 28),

              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is Email_errorstate) {
                    iconcolor = colors.errorcolor;
                    bordercolor = colors.errorcolor;
                  } else {
                    iconcolor = colors.backgroundcolor;
                    bordercolor = colors.backgroundcolor;
                  }
                  return ResubaleTextfield(
                    obscuretext: false,
                    focusnode: emailf1,
                    onchanged: (value) {
                      BlocProvider.of<LoginBloc>(context).add(
                          Login_textchangeevent(
                              emailcontroller.text, passwordcontroller.text));
                    },
                    controller: emailcontroller,
                    bordercolor: bordercolor,
                    iconcolor: emailf1.hasFocus ? iconcolor : colors.textcolor1 ,
                    hinttext: 'Your Email',
                    svgimage: 'images/Message.svg',
                  );
                },
              ),

              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is Email_errorstate) {
                    return Text(
                      state.msg,
                      style: TextStyle(color: colors.errorcolor),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              Container(height: 8),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is Pass_errorstate) {
                    iconcolor = colors.errorcolor;
                    bordercolor = colors.errorcolor;
                  } else {
                    iconcolor = colors.backgroundcolor;
                    bordercolor = colors.backgroundcolor;
                  }
                  return ResubaleTextfield(
                    obscuretext: true,
                    focusnode: passf2,
                    onchanged: (value) {
                      BlocProvider.of<LoginBloc>(context).add(
                          Login_textchangeevent(
                              emailcontroller.text, passwordcontroller.text));
                    },
                    controller: passwordcontroller,
                    bordercolor: bordercolor,
                    iconcolor: passf2.hasFocus ? iconcolor : colors.textcolor1,
                    hinttext: 'Password',
                    svgimage: 'images/Password.svg',
                  );
                },
              ),

              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is Pass_errorstate) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        children: [
                          Text(
                            state.msg,
                            style: TextStyle(color: colors.errorcolor),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),

              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return CupertinoButton(
                      child: Container(
                        height: 57,
                        decoration: BoxDecoration(
                            color: colors.backgroundcolor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sign In ',
                              style: TextStyle(
                                  color: colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      onPressed: () {
                        if (state is LogIn_validstate) {
                          BlocProvider.of<LoginBloc>(context).add(
                              Login_Submitted(emailcontroller.text,
                                  passwordcontroller.text));
                        }
                      });
                },
              ),

              Padding(
                padding: const EdgeInsets.only(top: 21, left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 150,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Text('OR',
                        style: TextStyle(
                            color: colors.textcolor1,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      width: 150,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 16),
              ResubaleButton1(
                textcolor: colors.textcolor1,
                bordercolor: colors.light,
                buttoncolor: colors.white,
                image: 'images/Google.png',
                onpressed: () {},
                text: 'Login with Google',
              ),
              ResubaleButton1(
                textcolor: colors.textcolor1,
                bordercolor: colors.light,
                buttoncolor: colors.white,
                image: 'images/Facebook.png',
                onpressed: () {},
                text: 'Login with facebook',
              ),
              
              Text('Forgot Password ?',
                  style: TextStyle(
                      color: colors.backgroundcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12)),
              Container(height: 8),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t have a account?',
                      style: TextStyle(
                          color: colors.textcolor1,
                          //fontWeight: FontWeight.bold,
                          fontSize: 12)),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                    create: (context) => Signup_bloc(),
                                    child: SignUp(),
                                  )));
                    },
                    child: Text('Register',
                        style: TextStyle(
                            color: colors.backgroundcolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                  )
                ],
              ),
              
              Container(height: 113),
            ],
          ),
        ),
      ),
    ));
  }
}
