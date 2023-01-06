import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _cinController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  var loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              child: Image.asset('lib/images/create_account4.gif'),
              height: 300,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 1,
            ),
            child: Form(
                child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Name';
                      }
                      return null;
                    },
                    //maxLength: 20,
                    decoration: InputDecoration(
                        hintText: "Username",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.length < 8 ||
                          value.length > 8) {
                        return 'Please enter your 8 numbers Cin';
                      }
                      return null;
                    },
                    //maxLength: 8,
                    keyboardType: TextInputType.number,
                    controller: _cinController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.format_list_numbered),
                        labelText: 'Cin',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
                    //maxLength: 30,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email),
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
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _ageController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.length < 2 ||
                          value.length > 2) {
                        return 'Please enter your Age and must be 2 numbers';
                      }
                      return null;
                    },
                    //maxLength: 2,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Age",
                        prefixIcon: Icon(Icons.pin),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _phoneController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.length < 8 ||
                          value.length > 8) {
                        return 'Please enter your Phone number and must be 8 numbers';
                      }
                      return null;
                    },
                    //maxLength: 8,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Phone",
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(3),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (() {
                            Navigator.of(context).pushNamed("login");
                          }),
                          child: Row(
                            children: [
                              Text(
                                "Already have account ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 70, 75, 80),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              Icon(
                                Icons.login,
                                color: Color.fromARGB(255, 126, 142, 155),
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                      child: SizedBox(
                    height: 50,
                    width: 300,
                    child: ElevatedButton.icon(
                      onPressed: () {

                        if (_formKey.currentState!.validate()) {
                          _signUp();

                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey, shape: StadiumBorder()),
                      icon: Icon(
                        Icons.login,
                        size: 25,
                      ),
                      label: Text(
                        "Create",
                        style: TextStyle(
                          fontSize: 16,
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
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
          ),
        ],
      ),
    ));
  }




















































































  Future _signUp() async {
  }
  void _handlesignUpError(FirebaseAuthException e) {
  }
}
