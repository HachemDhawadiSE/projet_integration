import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_page/auth/login.dart';
import 'package:login_page/home/homepage.dart';
import 'package:login_page/intro/intro_page_1.dart';
import 'package:login_page/intro/intro_page_2.dart';
import 'package:login_page/intro/intro_page_3.dart';
import 'package:login_page/intro/selfpage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Profil extends StatefulWidget {
  Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) => Scaffold(
        //backgroundColor: Colors.blue[50],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Signed in as ' + user.email!),
            SizedBox(
              height: 2,
            ),
            IconButton(
                onPressed: () {
                  signOut();
                  //FirebaseAuth.instance.signOut();
                },
                icon: Icon(
                  Icons.logout,
                  size: 30,
                )),
          ],
        )),
      );
  signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => Login()), (route) => false);
  }
}
