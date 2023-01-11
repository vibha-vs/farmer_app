import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final String name;
  final String email;

  const UserPage({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.pink,
          title: Text(name),
          centerTitle: true,
        ),
        // body: Image.network(
        //   urlImage,
        //   width: double.infinity,
        //   height: double.infinity,
        //   fit: BoxFit.cover,
        // ),
      );
}
