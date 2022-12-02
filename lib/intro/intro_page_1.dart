import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_page/intro/intro_page_1.dart';
import 'package:login_page/intro/intro_page_2.dart';
import 'package:login_page/intro/intro_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//import '../intro/self_page.dart';

class IntroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Image.asset(
                "lib/images/Shared-workspace.gif",
                height: 450,
              ),
              Text(
                "Hello User Welcome to Our App\n This Page Introduct And Define\n The Objectif Of This Application\n",
                style: TextStyle(
                  fontSize: 16,
                  // color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              Text(
                "Hello User Welcome to Our App\n This Page Introduct And Define\n The Objectif Of This Application\n",
                style: TextStyle(
                  fontSize: 16,
                  // color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
