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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                "lib/images/men3.jpg",
              ),
              radius: 100,
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("accueil");
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  primary: Colors.blueGrey,
                  shape: StadiumBorder()),
              icon: Icon(
                Icons.account_circle,
                size: 35,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              label: Text(
                'Signed in as ' + user.email!,
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("forgetpass");
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 90, vertical: 5),
                  primary: Colors.blueGrey,
                  shape: StadiumBorder()),
              icon: Icon(
                Icons.lock_reset,
                size: 35,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              label: Text(
                "Forget Password",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("accueil");
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 90, vertical: 5),
                  primary: Colors.blueGrey,
                  shape: StadiumBorder()),
              icon: Icon(
                Icons.help_outline,
                size: 35,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              label: Text(
                "Help",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: () {
                signOut();
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  primary: Colors.blueGrey,
                  shape: StadiumBorder()),
              icon: Icon(
                Icons.logout,
                size: 32,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              label: Text(
                "Sign Out",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ));

  signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => Login()), (route) => false);
  }
}
