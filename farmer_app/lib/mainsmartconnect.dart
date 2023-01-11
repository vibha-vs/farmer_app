import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'mainadddetails.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Text(
            'Smart Connect',
            style: TextStyle(fontSize: 20),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Crops').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(color: Colors.green, offset: Offset(5, 5))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 20, 23),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text(
                              'Farmer Name :  ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              snapshot.data!.docs[index]['Fullname'],
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
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              snapshot.data!.docs[index]['Cropname'],
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
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              snapshot.data!.docs[index]['Quantity'],
                              style: TextStyle(fontSize: 18),
                            ),
                          ]),
                          SizedBox(height: 10),
                          Row(children: [
                            Text(
                              'Description :  ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              snapshot.data!.docs[index]['Description'],
                              style: TextStyle(fontSize: 18),
                            ),
                          ]),
                          SizedBox(height: 10),
                          Row(children: [
                            Text(
                              'Location :  ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              snapshot.data!.docs[index]['Location'],
                              style: TextStyle(fontSize: 20),
                            )
                          ]),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Contact :  ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                snapshot.data!.docs[index]['Contact'],
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
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
