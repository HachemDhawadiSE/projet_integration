import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Forgetpass extends StatefulWidget {
  Forgetpass({Key? key}) : super(key: key);

  @override
  _ForgetpassState createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {
  final navigatorKey = GlobalKey<NavigatorState>();

  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Forgetpass(),
      );
  }

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: Text('email sent'),
          content:
              Text("An email have been sent succefully ,check your account "),
          actions: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("login");
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              label: Text(
                "Login again",
                style: TextStyle(fontSize: 18),
              ),
              icon: Icon(Icons.replay),
            ),
          ],
        ),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: Text('email failed'),
          content: Text(e.message.toString()),
          actions: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              label: Text(
                "Try again",
                style: TextStyle(fontSize: 18),
              ),
              icon: Icon(Icons.no_accounts_sharp),
            ),
          ],
        ),
      );
    }
  }
}
