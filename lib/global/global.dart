import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentFirebaseUser;
String titleStarsRating = "Good";
bool isDriverActive = false;
Color buttonColor = Colors.grey;
