import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import '/user.dart';
import 'mainsmartconnect.dart';
import 'widgets/navigation_drawer_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyDetails());
}

class MyDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Add Details';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(65, 10, 10, 8),
            child: Text(
              appTitle,
              style: TextStyle(fontSize: 23),
            ),
          ),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.

  final _formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final userLocationController = TextEditingController();
  final userCropnameController = TextEditingController();
  final userPriceController = TextEditingController();
  final userQuantityController = TextEditingController();
  final userDescriptionController = TextEditingController();
  final userContactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 20, 10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
                controller: userNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(20),
                  icon: const Icon(Icons.account_circle_sharp),
                  hintText: 'Enter your full name',
                  labelText: 'Full Name',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 20, 10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
                controller: userCropnameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(20),
                  icon: const Icon(Icons.eco_rounded),
                  hintText: 'Enter Crop name',
                  labelText: 'Crop Name',
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 20, 10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
                controller: userPriceController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(20),
                  icon: const Icon(Icons.chevron_right),
                  hintText: 'Enter the price',
                  labelText: 'Price',
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 20, 10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
                controller: userQuantityController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(20),
                  icon: const Icon(Icons.production_quantity_limits_outlined),
                  hintText: 'Enter Quantity',
                  labelText: 'Quantity',
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 20, 10),
              child: TextField(
                controller: userDescriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(20),
                  icon: const Icon(Icons.border_color_outlined),
                  hintText: 'Enter the description of the crop',
                  labelText: 'Description',
                ),
                style: TextStyle(fontSize: 17),
                maxLines: 10,
                minLines: 2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 20, 10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
                controller: userLocationController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(20),
                  icon: const Icon(Icons.location_on_sharp),
                  hintText: 'Enter Farm Location',
                  labelText: 'Farm Location',
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 20, 10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
                controller: userContactController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(20),
                  icon: const Icon(Icons.add_ic_call_outlined),
                  hintText: 'Enter the contact details',
                  labelText: 'Contact',
                ),
              ),
            ),
            SizedBox(height: 10),
            // ignore: unnecessary_new
            new Container(
              padding:
                  const EdgeInsets.only(left: 150.0, top: 25.0, bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  primary: Colors.green, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyConnect()));
                  }
                  final agri = Agri(
                    Cropname: userCropnameController.text,
                    Price: userPriceController.text,
                    Quantity: userQuantityController.text,
                    Description: userDescriptionController.text,
                    Contact: userContactController.text,
                    Fullname: userNameController.text,
                    Location: userLocationController.text,
                  );

                  createUser(agri);
                },
                child: Text(
                  'Upload',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future createUser(Agri agri) async {
    final docUser = FirebaseFirestore.instance.collection('Crops').doc();
    agri.id = docUser.id;
    final json = agri.toJson();

    await docUser.set(json);
  }
}
