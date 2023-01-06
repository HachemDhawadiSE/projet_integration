//import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login_page/auth/google_sign_in.dart';
import 'package:login_page/auth/login.dart';
import 'package:login_page/auth/signup.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:login_page/home/accueil.dart';
import 'package:login_page/home/accueiladmin.dart';
import 'package:login_page/home/homepage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_page/home/profil.dart';
import 'package:provider/provider.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

class Loginlogic extends StatefulWidget {
  Loginlogic({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Loginlogic> {
  bool hasInternet = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final navigatorKey = GlobalKey<NavigatorState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Login(),
        );
  }

  Future signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      Navigator.of(context).pop();
      if (Navigator.canPop(context)) {
      } else {
        print("user ghalet login");
      }
    } catch (e) {
      Navigator.of(context).pop();
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: const Text('Incorrect'),
          content: const Text('Email or Password inccorect'),
          actions: <Widget>[
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                icon: Icon(Icons.key_off),
                label: Text(
                  "try again",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  Future signIn2() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      if (_emailController.text.trim() == "admin@gmail.com" &&
          _passwordController.text.trim() == "adminowner") {
        Navigator.of(context).pop();
        print("admin logged in");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => AccueilAdmin()),
            (route) => false);
      } else {
        Navigator.of(context).pop();
        print("no login");
      }
    } catch (e) {
      Navigator.of(context).pop();
      print(e);
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: const Text('Incorrect'),
          content: const Text('Email or Password inccorect'),
          actions: <Widget>[
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                icon: Icon(Icons.key_off),
                label: Text(
                  "try again",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

class _buildBody {
  
}

