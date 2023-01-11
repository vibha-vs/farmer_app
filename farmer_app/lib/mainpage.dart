import 'package:carousel_slider/carousel_slider.dart';
import 'package:farmer_app/mainsmartconnect.dart';
import 'package:farmer_app/src/model/weather.dart';
import 'package:farmer_app/src/ui/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '/mainnews.dart';
import 'mainsmartconnect.dart';
import '/screen/welcome_screen.dart';
import './carousel.dart';
import 'screens/sign_in_screen.dart';
import "./firebase_options.dart";
import 'mainweather.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import '/widgets/button_widget.dart';
import '/widgets/navigation_drawer_widget.dart';

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
    return const MaterialApp(
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
          padding: const EdgeInsets.only(top: 20),
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
      body:
          //Stack(
          //children: [
          Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/farm.jpg"), fit: BoxFit.cover),
        ),
      ),
      // const Positioned(
      //   child: Image(
      //     image: AssetImage("assets/images/Diagram.png"),
      //   ),
      // ),
      //],
    );
    // body: Builder(
    //   builder: (context) => Container(
    //     alignment: Alignment.center,
    //     padding: EdgeInsets.symmetric(horizontal: 32),
    //     child: ButtonWidget(
    //       icon: Icons.open_in_new,
    //       text: 'Open Drawer',
    //       onClicked: () {
    //         Scaffold.of(context).openDrawer();
    //         // Scaffold.of(context).openEndDrawer();
    //       },
    //     ),
    //   ),
    // ),
    // body: Stack(
    //   children: [
    //     Positioned(
    //       bottom: 0,
    //       left: 0,
    //       child: SizedBox(
    //         width: size.width,
    //         height: 80,
    //         child: Stack(
    //           children: [
    //             CustomPaint(
    //               size: Size(size.width, 80),
    //               painter: BNBCustomPainter(),
    //             ),
    //             Center(
    //               heightFactor: 0.6,
    //               child: FloatingActionButton(
    //                 onPressed: () {},
    //                 backgroundColor: const Color.fromARGB(255, 35, 216, 41),
    //                 elevation: 0.1,
    //                 child: const Icon(Icons.home),
    //               ),
    //             ),
    //             SizedBox(
    //               width: size.width,
    //               height: 80,
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                 children: [
    //                   IconButton(
    //                     onPressed: () {
    //                       Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (context) => MyWeather()));
    //                     },
    //                     icon: const Icon(Icons.cloud),
    //                   ),
    //                   IconButton(
    //                     onPressed: () async {
    //                       Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (context) => MyNews()));
    //                     },
    //                     icon: const Icon(Icons.newspaper_sharp),
    //                   ),
    //                   Container(
    //                     width: size.width * 0.20,
    //                   ),
    //                   IconButton(
    //                     onPressed: () {},
    //                     icon: const Icon(Icons.home),
    //                   ),
    //                   // ignore: prefer_const_constructors
    //                   IconButton(
    //                     onPressed: () async {
    //                       Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (context) => MyConnect()));
    //                     },
    //                     icon: const Icon(Icons.account_circle_sharp),
    //                   ),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //     CarouselWithDotsPage(imgList: imgList),

    // bottomNavigationBar: CurvedNavigationBar(
    //   backgroundColor: Colors.greenAccent,
    //   items: [
    //     CurvedNavigationBarItem(
    //       child: Icon(Icons.home_outlined),
    //       label: 'Home',
    //     ),
    //     CurvedNavigationBarItem(
    //       child: Icon(Icons.connect_without_contact_outlined),
    //       label: 'Connect',
    //     ),
    //     CurvedNavigationBarItem(
    //       child: Icon(Icons.chat_bubble_outline),
    //       label: 'Chat',
    //     ),
    //     CurvedNavigationBarItem(
    //       child: Icon(Icons.newspaper),
    //       label: 'Feed',
    //     ),
    //     CurvedNavigationBarItem(
    //       child: Icon(Icons.cloud_outlined),
    //       label: 'Weather',
    //     ),
    //   ],
    //   onTap: (index) {
    //     setState(() {
    //       activeIndex = index;
    //     });
    //   },
    // ),
    // body: pages.elementAt(activeIndex),
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(255, 35, 216, 41)
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(
      Offset(size.width * 0.60, 20),
      radius: const Radius.circular(10.0),
      clockwise: false,
    );
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.green, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
