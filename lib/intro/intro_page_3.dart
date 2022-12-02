import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Image.asset(
                "lib/images/Telework.gif",
                height: 480,
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
