import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../src/ui/home/home_binding.dart';
import '../src/ui/home/home_screen.dart';

void main() {
  runApp(MyWeather());
}

class MyWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
          binding: HomeBinding(),
        )
      ],
    );
  }
}
