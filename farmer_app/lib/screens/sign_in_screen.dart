// import 'dart:ui';

// import 'package:firebase_auth/firebase_auth.dart';
// import '../reusable_widgets/reusable_widget.dart';
// import '../main.dart';
// import '../screens/reset_password.dart';
// import '../screens/signup_screen.dart';
// import '../utils/color_utils.dart';
// import 'package:flutter/material.dart';
// import 'otp.dart';

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({Key? key}) : super(key: key);

//   @override
//   _SignInScreenState createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   // TextEditingController _passwordTextController = TextEditingController();
//   // TextEditingController _emailTextController = TextEditingController();
//   TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     var phone = Icons.phone;
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(colors: [
//           // hexStringToColor("CB2B93"),
//           // hexStringToColor("9546C4"),
//           // hexStringToColor("5E61F4")
//           Colors.green,
//           Colors.lightGreen,
//           Colors.greenAccent,
//         ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.fromLTRB(
//                 20, MediaQuery.of(context).size.height * 0.2, 20, 0),
//             child: Column(
//               children: <Widget>[
//                 Text(
//                   'ಅನ್ನದಾತ',
//                   style: TextStyle(
//                     fontSize: 50,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 // const Image(
//                 //   image: AssetImage("assets/images/blacktree2.png"),
//                 // ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 // reusableTextField(
//                 //   "Enter Phone Number",
//                 //   Icons.phone,
//                 //   false,
//                 //   _controller,
//                 // ),
//                 Container(
//                   margin: EdgeInsets.only(top: 40, right: 10, left: 10),
//                   child: TextField(
//                     autofocus: true,
//                     // ignore: prefer_const_constructors
//                     decoration: InputDecoration(
//                       hintText: 'Phone Number',
//                       hintStyle: TextStyle(color: Colors.white),
//                       prefix: Padding(
//                         padding: EdgeInsets.all(4),
//                         child: Text('+91'),
//                       ),
//                     ),
//                     maxLength: 10,
//                     keyboardType: TextInputType.number,

//                     controller: _controller,

//                     cursorColor: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 // reusableTextField("Enter Password", Icons.lock_outline, true,
//                 //     _passwordTextController),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 //forgetPassword(context),
//                 // firebaseUIButton(context, "Log In", () {
//                 //   FirebaseAuth.instance
//                 //       .signInWithPhoneNumber(
//                 //           // email: _emailTextController.text,
//                 //           // password: _passwordTextController.text)

//                 //       .then((value) {
//                 //     Navigator.push(context,
//                 //         MaterialPageRoute(builder: (context) => MyHomePage()));
//                 //   }).onError((error, stackTrace) {
//                 //     print("Error ${error.toString()}");
//                 //   }));
//                 //}
//                 Container(
//                   margin: EdgeInsets.all(10),
//                   width: double.infinity,
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => MyOtp(_controller.text)));
//                     },
//                     style: TextButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         textStyle: TextStyle(fontSize: 18)),
//                     child: Text(
//                       'Next',
//                       style: TextStyle(
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//                 signUpOption()
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Row signUpOption() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text("Don't have account?",
//             style: TextStyle(color: Colors.white70)),
//         GestureDetector(
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => SignUpScreen()));
//           },
//           child: const Text(
//             " Sign Up",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         )
//       ],
//     );
//   }

//   // Widget forgetPassword(BuildContext context) {
//   //   return Container(
//   //     width: MediaQuery.of(context).size.width,
//   //     height: 35,
//   //     alignment: Alignment.bottomRight,
//   //     child: TextButton(
//   //       child: const Text(
//   //         "Forgot Password?",
//   //         style: TextStyle(color: Colors.white70),
//   //         textAlign: TextAlign.right,
//   //       ),
//   //       onPressed: () => Navigator.push(
//   //           context, MaterialPageRoute(builder: (context) => ResetPassword())),
//   //     ),
//   //   );
//   // }
// }
