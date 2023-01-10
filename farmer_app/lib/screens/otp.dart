// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:pinput/pinput.dart';
// import 'package:project/main.dart';
// import 'sign_in_screen.dart';

// class MyOtp extends StatefulWidget {
//   //const MyOtp({super.key});
//   final String phone;
//   MyOtp(this.phone);
//   @override
//   State<MyOtp> createState() => MyOtpState();
// }

// class MyOtpState extends State<MyOtp> {
//   final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
//   String? _verificationCode;
//   final TextEditingController _pinPutController = TextEditingController();

//   final defaultPinTheme = PinTheme(
//     width: 56,
//     height: 56,
//     textStyle: TextStyle(
//         fontSize: 20,
//         color: Color.fromRGBO(30, 60, 87, 1),
//         fontWeight: FontWeight.w600),
//     decoration: BoxDecoration(
//       border: Border.all(color: Colors.black),
//       borderRadius: BorderRadius.circular(20),
//     ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldkey,
//       appBar: AppBar(
//         title: Text(
//           'OTP Verification',
//         ),
//         titleSpacing: 00.0,
//         centerTitle: true,
//         toolbarHeight: 60.2,
//         toolbarOpacity: 0.8,
//         backgroundColor: const Color.fromARGB(255, 35, 216, 41),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(25),
//               bottomLeft: Radius.circular(25)),
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 40),
//             child: Center(
//               child: Text(
//                 'Verify +91-${widget.phone}',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(30.0),
//             child: Pinput(
//               length: 6,
//               defaultPinTheme: defaultPinTheme,
//               controller: _pinPutController,
//               pinAnimationType: PinAnimationType.fade,
//               onSubmitted: (pin) async {
//                 try {
//                   await FirebaseAuth.instance
//                       .signInWithCredential(PhoneAuthProvider.credential(
//                           verificationId: _verificationCode!, smsCode: pin))
//                       .then((value) async {
//                     if (value.user != null) {
//                       Navigator.pushAndRemoveUntil(
//                           context,
//                           MaterialPageRoute(builder: (context) => MyHomePage()),
//                           (route) => false);
//                     }
//                   });
//                 } catch (e) {
//                   ScaffoldMessenger.of(context)
//                       .showSnackBar(SnackBar(content: Text(e.toString())));
//                 }
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   _verifyPhone() async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: '+91${widget.phone}',
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           await FirebaseAuth.instance
//               .signInWithCredential(credential)
//               .then((value) async {
//             if (value.user != null) {
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyHomePage()),
//                   (route) => false);
//             }
//           });
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           print(e.message);
//         },
//         codeSent: (String? verficationID, int? resendToken) {
//           setState(() {
//             _verificationCode = verficationID;
//           });
//         },
//         codeAutoRetrievalTimeout: (String verificationID) {
//           setState(() {
//             _verificationCode = verificationID;
//           });
//         },
//         timeout: Duration(seconds: 120));
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _verifyPhone();
//   }
// }
