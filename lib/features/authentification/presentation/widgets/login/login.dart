//import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login_page/auth/google_sign_in.dart';
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

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _emailController.text = '';
                _passwordController.text = '';
                return Accueil();
              } else {
                print("hh");
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        child: Image.asset(
                          "lib/images/login2.jpg",
                          height: 380,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _emailController,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        !RegExp(r"[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@gmail.com")
                                            .hasMatch(value)) {
                                      return 'Please enter your Email Or check @ and .com';
                                    } else {
                                      print("true");
                                    }
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      prefixIcon: Icon(Icons.mail_lock),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 3))),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your Password';
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      prefixIcon: Icon(Icons.lock),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 3))),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (() {
                                    Navigator.of(context)
                                        .pushNamed("forgetpass");
                                  }),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Forget password ",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Color.fromARGB(255, 70, 75, 80),
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      Icon(
                                        Icons.lock_reset_outlined,
                                        color:
                                            Color.fromARGB(255, 126, 142, 155),
                                        size: 25,
                                      )
                                    ],
                                  ),
                                ),
                                Spacer(
                                  flex: 2,
                                ),
                                InkWell(
                                  onTap: (() {
                                    Navigator.of(context).pushNamed("signup");
                                  }),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Create account ",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Color.fromARGB(255, 70, 75, 80),
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      Icon(
                                        Icons.add_circle,
                                        color:
                                            Color.fromARGB(255, 126, 142, 155),
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              child: SizedBox(
                            height: 50,
                            width: 300,
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                final text;
                                final color;
                                hasInternet = await InternetConnectionChecker()
                                    .hasConnection;
                                if (hasInternet == true) {
                                  text = 'Internet exist';
                                  color = Colors.green;
                                  showSimpleNotification(Text('$text'),
                                      background: color);
                                  if (_formKey.currentState!.validate()) {
                                    signIn2();
                                  }
                                } else {
                                  text = 'check Your Connexion to sign Up !';
                                  color = Colors.red;
                                  showSimpleNotification(Text('$text'),
                                      background: color);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blueGrey,
                                  shape: StadiumBorder()),
                              icon: Icon(
                                Icons.login,
                                size: 25,
                              ),
                              label: Text(
                                "Login in",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          )),
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: <Widget>[
                            Expanded(
                                child: Divider(
                              color: Color.fromARGB(237, 45, 48, 48),
                            )),
                            Text("OR"),
                            Expanded(
                                child: Divider(
                              color: Color.fromARGB(237, 45, 48, 48),
                            )),
                          ]),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              child: SizedBox(
                            height: 50,
                            width: 300,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                final provider =
                                    Provider.of<GoogleSignInProvider>(context,
                                        listen: false);
                                provider.googleLogin();
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 255, 255, 255),
                                  shape: StadiumBorder()),
                              icon: FaIcon(
                                FontAwesomeIcons.google,
                                size: 25,
                                color: Colors.red,
                              ),
                              label: Text(
                                " Sign up with google",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              child: SizedBox(
                            height: 50,
                            width: 300,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed("accueil");
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff3b5998),
                                  shape: StadiumBorder()),
                              icon: Icon(
                                Icons.facebook,
                                size: 35,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              label: Text(
                                "Sign up with Facebook",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              child: SizedBox(
                            height: 50,
                            width: 300,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed("accueil");
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 96, 102, 107),
                                  shape: StadiumBorder()),
                              icon: Icon(
                                Icons.email_rounded,
                                size: 35,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              label: Text(
                                "Sign up with email",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              "© Copyright 2022",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 97, 92, 92),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
  }




























  Future signIn2() async {
  }

}

