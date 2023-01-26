import 'package:farmer_app/mainadddetails.dart';
import 'package:farmer_app/mainnews.dart';
import 'package:farmer_app/mainpage.dart';
import 'package:farmer_app/mainsmartconnect.dart';
import 'package:farmer_app/mainweather.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:navigation_drawer_example/page/favourites_page.dart';
// import 'package:navigation_drawer_example/page/people_page.dart';
import '../screen/welcome_screen.dart';
import 'user_page.dart';

class NavigationDrawerWidget extends StatefulWidget {
  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  String? name = '', email = '';
  @override
  Widget build(BuildContext context) {
//     FirebaseUser user = FirebaseAuth.getInstance().getCurrentUser();

// String name = user.getDisplayName();
// String email = user.getEmail();
    // User user;
    // Future<void> getUserData() async {
    //   User userData = await FirebaseAuth.instance.currentUser!;
    //   setState(() {
    //     user = userData;
    //     name = userData.displayName;
    //     email = userData.email;
    //   });
    // }
// User user = FirebaseAuth.getInstance().getCurrentUser();

// String name = user.displayName!;
// String email = user.getEmail();
    // @override
    // void initState() {
    //   super.initState();
    //   getUserData();
    // }
    // final name = 'Sarah Abs';
    // final email = 'sarah@abs.com';
    // final urlImage =
    //     'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            //buildHeader(
            //urlImage: urlImage,
            // name: name!,
            // email: email!,
            // onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => UserPage(
            //     name: name!,
            //     //urlImage: urlImage,
            //     email: email!,
            //   ),
            // )),
            //),
            // Text(name),
            // Text(email),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'MENU',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 41, 98, 43),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                  buildSearchField(),
                  const SizedBox(height: 35),

                  buildMenuItem(
                    text: 'Home Page',
                    icon: Icons.home,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  const SizedBox(height: 20),
                  buildMenuItem(
                    text: 'Smart Connect',
                    icon: Icons.connect_without_contact,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 20),
                  buildMenuItem(
                    text: 'Add Crop Details',
                    icon: Icons.eco_sharp,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 20),
                  buildMenuItem(
                    text: 'Weather Updates',
                    icon: Icons.cloud,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 20),
                  buildMenuItem(
                    text: 'Agriculture News',
                    icon: Icons.feed,
                    onClicked: () => selectedItem(context, 3),
                  ),

                  const SizedBox(height: 120),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade800,
                        shadowColor: Colors.black,
                        elevation: 10),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      if (!mounted) return;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const WelcomeScreen();
                      }));
                    },
                    child: const Text(
                      "Sign Out",
                    ),
                  )
                  // Divider(color: Colors.white70),
                  // const SizedBox(height: 24),
                  // buildMenuItem(
                  //   text: 'Plugins',
                  //   icon: Icons.account_tree_outlined,
                  //   onClicked: () => selectedItem(context, 4),
                  // ),
                  // const SizedBox(height: 16),
                  // buildMenuItem(
                  //   text: 'Notifications',
                  //   icon: Icons.notifications_outlined,
                  //   onClicked: () => selectedItem(context, 5),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    //required String urlImage,
    required String name,
    required String email,
    //required VoidCallback onClicked,
  }) =>
      InkWell(
        //onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              //CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white),
              )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.green,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Color.fromARGB(255, 47, 109, 49);
    final hoverColor = Colors.green;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyConnect(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyDetails(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyWeather(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyNews(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyHome(),
        ));
        break;
    }
  }
}
