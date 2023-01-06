import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lafyuu/Utils/Widgets/passwordtextfield.dart';
import 'package:lafyuu/bloc/loginbloc/login_bloc.dart';
import 'package:lafyuu/bloc/loginbloc/login_events.dart';
import 'package:lafyuu/bloc/loginbloc/login_state.dart';
import 'package:lafyuu/Utils/Services/state_services.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/Utils/Widgets/resubalebutton1.dart';
import 'package:lafyuu/Utils/Widgets/reusable_texfield.dart';
import 'package:lafyuu/bloc/loginbloc/login_state.dart';



class LoginForm extends StatefulWidget {
  final StateService stateService;
  const LoginForm({ Key? key, required this.stateService }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<LoginForm> createState() => _LoginFormState(stateService);
}

class _LoginFormState extends State<LoginForm> {

  final StateService stateService;
  _LoginFormState(this.stateService);
  AppColors colors = AppColors();
  FocusNode emailf1 = FocusNode() ;
  FocusNode passf2 = FocusNode () ;
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context,state){
      if(state is LoginFailure){
        Scaffold.of(context).showSnackBar(
          const SnackBar(content: Text('Login Failure'),
          backgroundColor: Colors.red,
          )
        );
      }
    },
    child: BlocBuilder<LoginBloc,LoginState>(builder: (context, state){
            return SingleChildScrollView(
              child: Form(
                key:formkey,
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
            
                  ResubaleTextfield(
                        obscuretext: false,
                        focusnode: emailf1,
                        onchanged: (value) {
                          
                        },
                        controller: emailcontroller,
                        bordercolor: colors.textcolor1 ,
                        iconcolor: colors.textcolor1 ,
                        hinttext: 'Your Email',
                        svgimage: 'images/Message.svg',
                      ),
                  
                  Container(height: 8),
                  
                  ResubaleTextfield2(
                        obscuretext: true,
                        focusnode: passf2,
                        onchanged: (value) {
                          
                        },
                        controller: passwordcontroller,
                        bordercolor: colors.textcolor1,
                        iconcolor: colors.textcolor1,
                        hinttext: 'Password',
                        svgimage: 'images/Password.svg',
                      ),
                   
            
            
                  SizedBox(
                    child:state is LoginLoading ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Column(
                                children: const [
                                  // ignore: prefer_const_constructors
                                  SizedBox(
                                    height:25,
                                    width: 25,
                                    child: CupertinoActivityIndicator(),
                                  )
                                ],
                              ),
                            )
                          ],
                    ):
                    CupertinoButton(
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
                              if( formkey.currentState!.validate()){
                                
                            BlocProvider.of<LoginBloc>(context).add(
                            Login_Submitted(email:emailcontroller.text,
                            password: passwordcontroller.text));
                              
                              }
                            
                            
                              
                            }),
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

                  Container(height: 8),

                  ResubaleButton1(
                    textcolor: colors.textcolor1,
                    bordercolor: colors.light,
                    buttoncolor: colors.white,
                    image: 'images/Facebook.png',
                    onpressed: () {},
                    text: 'Login with facebook',
                  ),
                  Container(height: 8),
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
                        onTap: () {},
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
                )
                ),
            );
          }),
    );
  }
}