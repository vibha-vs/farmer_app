import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:smart_connect/user.dart';

class Agri {
  String id;
  final String Cropname;
  final String Price;
  final String Quantity;
  final String Description;
  final String Contact;
  final String Location;
  final String Fullname;

  Agri({
    this.id = '',
    required this.Cropname,
    required this.Price,
    required this.Quantity,
    required this.Description,
    required this.Contact,
    required this.Fullname,
    required this.Location,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'Cropname': Cropname,
        'Price': Price,
        'Quantity': Quantity,
        'Description': Description,
        'Contact': Contact,
        'Location': Location,
        'Fullname': Fullname,
      };

  static Agri fromJson(Map<String, dynamic> json) => Agri(
        id: json['id'],
        Cropname: json['Cropname'],
        Price: json['Price'],
        Quantity: json['Quantity'],
        Description: json['Description'],
        Contact: json['Contact'],
        Location: json['Location'],
        Fullname: json['Fullname'],
      );
}
