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
        body: SignUp(),
        );
  }

  Future _signUp() async {
    setState(() {
      loading = true;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      await FirebaseFirestore.instance.collection('products').add({
        'name': _nameController.text,
        'cin': _cinController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
        'phone': _phoneController.text,
        'age': _ageController.text
      });

      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: const Text('Account created'),
          content: const Text('Your account have been created'),
          actions: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('login');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              label: Text(
                "OK",
                style: TextStyle(fontSize: 18),
              ),
              icon: Icon(Icons.check),
            ),
          ],
        ),
      );

      print("ok");

    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      _handlesignUpError(e);
      setState(() {
        loading = false;
      });
    }

    _emailController.text = '';
  }

  void _handlesignUpError(FirebaseAuthException e) {
    String messageToDisplay = '';
    switch (e.code) {
      case 'email-already-in-use':
        messageToDisplay = 'Email already exist try another';
        break;
      case 'invalide email':
        messageToDisplay = 'the email is invalide';
        break;
      case 'operation-not-allowed':
        messageToDisplay = 'not allowed';
        break;
      case 'week-password':
        messageToDisplay = 'too week';
        break;
      default:
        messageToDisplay = 'week-password';
        break;
    }
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        title: Text('Sign Up faield'),
        content: Text(messageToDisplay),
        actions: <Widget>[
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            label: Text(
              "Change",
              style: TextStyle(fontSize: 18),
            ),
            icon: Icon(Icons.unsubscribe),
          ),
        ],
      ),
    );
  }
}
