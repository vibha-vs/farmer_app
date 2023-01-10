// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:project/screens/sign_in_screen.dart';
// import '../reusable_widgets/reusable_widget.dart';
// import '../main.dart';
// import '../utils/color_utils.dart';
// import 'package:flutter/material.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   //TextEditingController _passwordTextController = TextEditingController();
//   TextEditingController _controller = TextEditingController();
//   TextEditingController _userNameTextController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text(
//           "Sign Up",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: const BoxDecoration(
//               gradient: LinearGradient(colors: [
//             // hexStringToColor("CB2B93"),
//             // hexStringToColor("9546C4"),
//             // hexStringToColor("5E61F4")
//             Colors.green,
//             Colors.lightGreen,
//             Colors.greenAccent,
//           ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
//           child: SingleChildScrollView(
//               child: Padding(
//             padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
//             child: Column(
//               children: <Widget>[
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 reusableTextField("Enter Name", Icons.person_outline, false,
//                     _userNameTextController),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 reusableTextField(
//                     "Enter Phone Number", Icons.phone, false, _controller),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 // reusableTextField("Enter Password", Icons.lock_outlined, true,
//                 //     _passwordTextController),
//                 // const SizedBox(
//                 //   height: 20,
//                 // ),
//                 firebaseUIButton(context, "Sign Up", () {
//                   FirebaseAuth.instance
//                       .verifyPhoneNumber(
//                           // email: _emailTextController.text,
//                           // password: _passwordTextController.text
//                           phoneNumber: _controller.text,
//                           verificationCompleted:
//                               (PhoneAuthCredential _controller) {},
//                           verificationFailed: (FirebaseAuthException e) {},
//                           codeSent:
//                               (String verificationId, int? resendToken) {},
//                           codeAutoRetrievalTimeout: (String verificationId) {})
//                       .then((value) {
//                     print("Created New Account");
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => MyHomePage()));
//                   }).onError((error, stackTrace) {
//                     print("Error ${error.toString()}");
//                   });
//                 })
//               ],
//             ),
//           ))),
//     );
//   }
// }
