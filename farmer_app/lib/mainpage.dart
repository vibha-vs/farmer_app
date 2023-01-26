//import 'dart:html';

import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:farmer_app/mainadddetails.dart';
import 'package:farmer_app/mainsmartconnect.dart';
import 'package:farmer_app/src/model/weather.dart';
import 'package:farmer_app/src/ui/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '/mainnews.dart';
import 'mainsmartconnect.dart';
import '/screen/welcome_screen.dart';
import './carousel.dart';
import 'miniweather.dart';
import 'screens/sign_in_screen.dart';
import "./firebase_options.dart";
import 'mainweather.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import '/widgets/button_widget.dart';
import '/widgets/navigation_drawer_widget.dart';
import 'mainadddetails.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyHome());
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: Colors.green),
      home: MyHomePage(),
    );
  }
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  // State class
  // List<Widget> pages = [
  //   MyHome(),
  //   MyConnect(),
  //   MyConnect(),
  //   MyNews(),
  //   MyWeather(),
  // ];
  // int activeIndex = 0;
  //GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: const Text(
            //'ಅನ್ನದಾತ',
            'ANNADAATA',
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 100,
        toolbarOpacity: 0.8,

        backgroundColor: Colors.transparent,
        elevation: 0,
        // const Color.fromARGB(255, 35, 216, 41),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
      ),
      // backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            //color: Colors.green,
            child: MyCard1(),

            // constraints: const BoxConstraints.expand(),
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage("assets/images/farm.jpg"),
            //       fit: BoxFit.cover),
            // ),
            //child: MiniWeather(),
          ),
          Container(
            //color: Colors.green,
            child: MyCard2(),
          ),
          Container(
            //color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(35, 10, 20, 30),
              child: Text(
                '"The Farmer has always been the backbone of our country and will continue to be so..."',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
          Container(
            //color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(150, 5, 5, 30),
              child: Text(
                '- Mahatma Gandhi',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCard1 extends StatelessWidget {
//MyCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 100, 8, 10),
        child: Container(
          width: 370,
          height: 200,
          padding: new EdgeInsets.only(top: 20),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.white,
            elevation: 25,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const ListTile(
                    //leading: Icon(Icons.album, size: 60),

                    title: Text('Join Our Community',
                        style: TextStyle(
                            fontSize: 30.0, fontStyle: FontStyle.italic)),
                    subtitle: Text('Add your Crop details here.',
                        style: TextStyle(fontSize: 18.0)),
                  ),
                ),
                ButtonBar(
                  //buttonPadding: EdgeInsets.all(8),
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyDetails()));
                      },
                      child: const Icon(Icons.add),
                      backgroundColor: Color.fromARGB(255, 36, 122, 39),
                    ),
                    // ElevatedButton(
                    //   child: const Text('Play'),
                    //   onPressed: () {/* ... */},
                    // ),
                    // ElevatedButton(
                    //   child: const Text('Pause'),
                    //   onPressed: () {/* ... */},
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // Divider(),
  }
}

class MyCard2 extends StatelessWidget {
//MyCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 30),
        child: Container(
          width: 370,
          height: 240,
          padding: new EdgeInsets.only(top: 20),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.white,
            elevation: 25,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const ListTile(
                    //leading: Icon(Icons.album, size: 60),

                    title: Text('Connect with other Farmers like you!',
                        style: TextStyle(
                            fontSize: 30.0, fontStyle: FontStyle.italic)),
                    subtitle: Text('Click here to SmartConnect',
                        style: TextStyle(fontSize: 18.0)),
                  ),
                ),
                ButtonBar(
                  //buttonPadding: EdgeInsets.all(8),
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyConnect()));
                      },
                      child: const Icon(Icons.send),
                      backgroundColor: Color.fromARGB(255, 36, 122, 39),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// class BNBCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = const Color.fromARGB(255, 35, 216, 41)
//       ..style = PaintingStyle.fill;
//     Path path = Path()..moveTo(0, 20);
//     path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
//     path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
//     path.arcToPoint(
//       Offset(size.width * 0.60, 20),
//       radius: const Radius.circular(10.0),
//       clockwise: false,
//     );
//     path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
//     path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//     canvas.drawShadow(path, Colors.green, 5, true);
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
