import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'mainadddetails.dart';
import 'widgets/navigation_drawer_widget.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyConnect());
}

class MyConnect extends StatelessWidget {
  const MyConnect({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyFetch(),
    );
  }
}

class MyFetch extends StatefulWidget {
  const MyFetch({super.key});

  @override
  State<MyFetch> createState() => _MyFetchState();
}

class _MyFetchState extends State<MyFetch> {
  String search = '';
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(50, 10, 0, 10),
          child: Text(
            'Smart Connect',
            style: TextStyle(fontSize: 23),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body:

          // Padding(
          //   padding: const EdgeInsets.all(15.0),
          //   child: TextField(
          //     decoration: InputDecoration(
          //       border: OutlineInputBorder(),
          //       hintText: "Search here",
          //     ),
          //   ),
          // ),
          Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Crops').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, right: 15.0, left: 15.0, bottom: 8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: searchController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search here',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String? value) {
                          print(value);
                          setState(() {
                            search = value.toString();
                          });
                        },
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            String ans1 =
                                snapshot.data!.docs[index]['Fullname'];
                            String ans2 =
                                snapshot.data!.docs[index]['Cropname'];
                            String ans3 =
                                snapshot.data!.docs[index]['Location'];
                            if (searchController.text.isEmpty) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 15, 10, 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green[100],
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.green,
                                            offset: Offset(5, 5))
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 20, 20, 23),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(children: [
                                          Text(
                                            'Farmer Name :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                ['Fullname'],
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ]),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(children: [
                                          Text(
                                            'Crop Name :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                ['Cropname'],
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ]),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(children: [
                                          Text(
                                            'Price :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]['Price'],
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ]),
                                        SizedBox(height: 10),
                                        Row(children: [
                                          Text(
                                            'Quantity :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                ['Quantity'],
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ]),
                                        SizedBox(height: 10),
                                        Row(children: [
                                          Text(
                                            'Description :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                ['Description'],
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ]),
                                        SizedBox(height: 10),
                                        Row(children: [
                                          Text(
                                            'Location :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                ['Location'],
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ]),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text(
                                              'Contact :  ',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ['Contact'],
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else if (ans1
                                .toLowerCase()
                                .contains(searchController.text.toString())) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 15, 10, 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green[100],
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.green,
                                            offset: Offset(5, 5))
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 20, 20, 23),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(children: [
                                          Text(
                                            'Farmer Name :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            ans1,
                                            // snapshot.data!.docs[index]['Fullname'],
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ]),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(children: [
                                          Text(
                                            'Crop Name :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                ['Cropname'],
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ]),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(children: [
                                          Text(
                                            'Price :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]['Price'],
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ]),
                                        SizedBox(height: 10),
                                        Row(children: [
                                          Text(
                                            'Quantity :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                ['Quantity'],
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ]),
                                        SizedBox(height: 10),
                                        Row(children: [
                                          Text(
                                            'Description :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                ['Description'],
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ]),
                                        SizedBox(height: 10),
                                        Row(children: [
                                          Text(
                                            'Location :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                ['Location'],
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ]),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text(
                                              'Contact :  ',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ['Contact'],
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else if (ans2
                                .toLowerCase()
                                .contains(searchController.text.toString())) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 15, 10, 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green[100],
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.green,
                                            offset: Offset(5, 5))
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 20, 20, 23),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(children: [
                                          Text(
                                            'Farmer Name :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                ['Fullname'],
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ]),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(children: [
                                          Text(
                                            'Crop Name :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            ans2,
                                            // snapshot.data!.docs[index]
                                            //     ['Cropname'],
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ]),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(children: [
                                          Text(
                                            'Price :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]['Price'],
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ]),
                                        SizedBox(height: 10),
                                        Row(children: [
                                          Text(
                                            'Quantity :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                ['Quantity'],
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ]),
                                        SizedBox(height: 10),
                                        Row(children: [
                                          Text(
                                            'Description :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                ['Description'],
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ]),
                                        SizedBox(height: 10),
                                        Row(children: [
                                          Text(
                                            'Location :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                ['Location'],
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ]),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text(
                                              'Contact :  ',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ['Contact'],
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else if (ans3
                                .toLowerCase()
                                .contains(searchController.text.toString())) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 15, 10, 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green[100],
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.green,
                                            offset: Offset(5, 5))
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 20, 20, 23),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(children: [
                                          Text(
                                            'Farmer Name :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                ['Fullname'],
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ]),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(children: [
                                          Text(
                                            'Crop Name :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                ['Cropname'],
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ]),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(children: [
                                          Text(
                                            'Price :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]['Price'],
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ]),
                                        SizedBox(height: 10),
                                        Row(children: [
                                          Text(
                                            'Quantity :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                ['Quantity'],
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ]),
                                        SizedBox(height: 10),
                                        Row(children: [
                                          Text(
                                            'Description :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                ['Description'],
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ]),
                                        SizedBox(height: 10),
                                        Row(children: [
                                          Text(
                                            'Location :  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            ans3,
                                            // snapshot.data!.docs[index]
                                            //     ['Location'],
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ]),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text(
                                              'Contact :  ',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ['Contact'],
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyDetails()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
