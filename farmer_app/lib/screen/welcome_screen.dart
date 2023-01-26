import '/screen/login_screen.dart';
import '/screen/signup_screen.dart';
import '/widgets/customized_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 90,
              width: 280,
              // child: Image(
              //     image: AssetImage("assets/images/logo.png"),
              //     fit: BoxFit.cover),
              child: Text(
                'ANNADAATA',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            const SizedBox(height: 40),
            CustomizedButton(
              buttonText: "Login",
              buttonColor: Colors.black,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
            ),
            CustomizedButton(
              buttonText: "Register",
              buttonColor: Colors.white,
              textColor: Colors.black,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SignUpScreen()));
              },
            ),
            const SizedBox(height: 20),
            // const Padding(
            //   padding: EdgeInsets.all(10.0),
            //   child: Text(
            //     "Continue as a Guest",
            //     style: TextStyle(color: Color(0xff35C2C1), fontSize: 25),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
