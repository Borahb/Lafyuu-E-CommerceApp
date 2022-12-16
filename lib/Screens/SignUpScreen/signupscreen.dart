// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lafyuu/Screens/LoginScreen/login_bloc.dart';
// import 'package:lafyuu/Screens/LoginScreen/loginscreen.dart';
// import 'package:lafyuu/Screens/SignUpScreen/signup_bloc.dart';
// import 'package:lafyuu/Screens/SignUpScreen/signup_event.dart';
// import 'package:lafyuu/Screens/SignUpScreen/signup_state.dart';
// import 'package:lafyuu/Utils/colors.dart';
// import 'package:lafyuu/Utils/reusable_texfield.dart';

// class SignUp extends StatelessWidget {
//   const SignUp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     AppColors colors = AppColors();
//     Color iconcolor;
//     Color bordercolor;
//     FocusNode emailf1 = FocusNode();
//     FocusNode passf2 = FocusNode();
//     FocusNode passf3 = FocusNode();
//     FocusNode namef3 = FocusNode();

//     TextEditingController _emailcontroller = TextEditingController();
//     TextEditingController _passwordcontroller = TextEditingController();
//     TextEditingController _namecontroller = TextEditingController();

//     return Scaffold(
//       body: SafeArea(
//           child: SingleChildScrollView(
//               child: Center(
//                   child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 112),
//             child: Image.asset('images/Icon.jpg', height: 72, width: 72),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(top: 20),
//             child: Text(
//               "Let's Get Started ",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: Text(
//               'Create an new account',
//               style: TextStyle(color: colors.textcolor1, fontSize: 12),
//             ),
//           ),
//           Container(height: 28),
//           BlocBuilder<Signup_bloc, SignupState>(
//             builder: (context, state) {
//               if (state is SignupError_state) {
//                 iconcolor = colors.errorcolor;
//                 bordercolor = colors.errorcolor;
//               } else {
//                 iconcolor = colors.backgroundcolor;
//                 bordercolor = colors.backgroundcolor;
//               }
//               return ResubaleTextfield(
//                   obscuretext: false,
//                   focusnode: namef3 ,
//                   bordercolor: bordercolor,
//                   iconcolor: passf2.hasFocus ? iconcolor : colors.textcolor1,
//                   hinttext: 'Full Name',
//                   svgimage: 'images/User.svg',
//                   controller: _namecontroller,
//                   onchanged: (value) {
//                     BlocProvider.of<Signup_bloc>(context).add(
//                         Signuptextchange_event(_emailcontroller.text,
//                             _namecontroller.text, _passwordcontroller.text));
//                   });
//             },
//           ),
//           Container(height: 8),
//           BlocBuilder<Signup_bloc, SignupState>(
//             builder: (context, state) {
//               if (state is SignupError_state) {
//                 iconcolor = colors.errorcolor;
//                 bordercolor = colors.errorcolor;
//               } else {
//                 iconcolor = colors.backgroundcolor;
//                 bordercolor = colors.backgroundcolor;
//               }
//               return ResubaleTextfield(
//                 obscuretext: false,
//                 focusnode: emailf1,
//                 onchanged: (value) {
//                   BlocProvider.of<Signup_bloc>(context).add(
//                       Signuptextchange_event(_emailcontroller.text,
//                           _namecontroller.text, _passwordcontroller.text));
//                 },
//                 controller: _emailcontroller,
//                 bordercolor: bordercolor,
//                 iconcolor: passf2.hasFocus ? iconcolor : colors.textcolor1,
//                 hinttext: 'Your Email',
//                 svgimage: 'images/Message.svg',
//               );
//             },
//           ),
//           Container(height: 8),
//           BlocBuilder<Signup_bloc, SignupState>(
//             builder: (context, state) {
//               if (state is SignupError_state) {
//                 iconcolor = colors.errorcolor;
//                 bordercolor = colors.errorcolor;
//               } else {
//                 iconcolor = colors.backgroundcolor;
//                 bordercolor = colors.backgroundcolor;
//               }
//               return ResubaleTextfield(
//                 obscuretext:true,
//                 focusnode: passf2,
//                 onchanged: (value) {
//                   BlocProvider.of<Signup_bloc>(context).add(
//                       Signuptextchange_event(_emailcontroller.text,
//                           _namecontroller.text, _passwordcontroller.text));
//                 },
//                 controller: _passwordcontroller,
//                 bordercolor: bordercolor,
//                 iconcolor: passf2.hasFocus ? iconcolor : colors.textcolor1,
//                 hinttext: 'Password',
//                 svgimage: 'images/Password.svg',
//               );
//             },
//           ),
//           Container(height: 8),
//           BlocBuilder<Signup_bloc, SignupState>(
//             builder: (context, state) {
//               if (state is SignupError_state) {
//                 iconcolor = colors.errorcolor;
//                 bordercolor = colors.errorcolor;
//               } else {
//                 iconcolor = colors.backgroundcolor;
//                 bordercolor = colors.backgroundcolor;
//               }
//               return ResubaleTextfield(
//                 obscuretext:true,
//                 focusnode: passf3,
//                 onchanged: (value) {
//                   BlocProvider.of<Signup_bloc>(context).add(
//                       Signuptextchange_event(_emailcontroller.text,
//                           _namecontroller.text, _passwordcontroller.text));
//                 },
//                 controller: _passwordcontroller,
//                 bordercolor: bordercolor,
//                 iconcolor: passf3.hasFocus ? iconcolor : colors.textcolor1,
//                 hinttext: 'Password Again',
//                 svgimage: 'images/Password.svg',
//               );
//             },
//           ),

//           Container(height: 16),

//           BlocBuilder<Signup_bloc, SignupState>(
//                 builder: (context, state) {
//                   return CupertinoButton(
//                       child: Container(
//                         height: 57,
//                         decoration: BoxDecoration(
//                             color: colors.backgroundcolor,
//                             borderRadius: BorderRadius.circular(5)),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Sign Up',
//                               style: TextStyle(
//                                   color: colors.white,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                       ),
//                       onPressed: () {
//                         if (state is SignupValid_state) {
//                           BlocProvider.of<Signup_bloc>(context).add(
//                               Signupsubmitted_event(
//                                 _emailcontroller.text,
//                                 _namecontroller.text,
//                                 _passwordcontroller.text));
//                         }
//                       });
//                 },
//               ),

//           Container(height: 8),
              
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('have a account?',
//                   style: TextStyle(
//                       color: colors.textcolor1,
//                       //fontWeight: FontWeight.bold,
//                       fontSize: 12)),
//               const SizedBox(
//                 width: 5,
//               ),
//               GestureDetector(
//                 onTap: () {
//                 //   Navigator.pushReplacement(
//                 //       context,
//                 //       MaterialPageRoute(
//                 //           builder: (context) => BlocProvider(
//                 //                 create: (context) => LoginBloc(),
//                 //                 child: LoginScreen(),
//                 //               )));
//                 // 
//                  },
//                 child: Text('Sign In',
//                     style: TextStyle(
//                         color: colors.backgroundcolor,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12)),
//               )
//             ],
//           ),

//         ],
//       )))),
//     );
//   }
// }
