import 'package:flutter/material.dart';
import '/views/home.dart';

void main() => runApp(const MyNews());

class MyNews extends StatelessWidget {
  const MyNews({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
      ),
      home: const Home(),
    );
  }
}
