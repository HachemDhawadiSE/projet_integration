import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_page/home/homepage.dart';
import 'package:login_page/home/todo/constants/colors.dart';
import 'package:login_page/home/todo/postes.dart';
import 'package:login_page/intro/intro_page_1.dart';
import 'package:login_page/intro/intro_page_2.dart';
import 'package:login_page/intro/intro_page_3.dart';
import 'package:login_page/intro/selfpage.dart';
import 'package:login_page/model/post_list.dart';
import 'package:login_page/news/mytab.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../newstab/companytab.dart';
import '../newstab/moneytab.dart';
import '../newstab/worldtab.dart';

class News extends StatefulWidget {
  News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  PageController _controller = PageController();
  List<Widget> myTabs = const [
    //reunion
    MyTab(
      iconPath: 'lib/images/worldwide.png',
    ),
    //world
    MyTab(
      iconPath: 'lib/images/user.png',
    ),
    //micro
    MyTab(
      iconPath: 'lib/images/event.png',
    ),
  ];

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          //backgroundColor: tdBGColor,
          //backgroundColor: Colors.blue[50],
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.only(left: 24.0, right: 55),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.blueGrey[800],
                  size: 30,
                ),
                onPressed: () {
                  // open drawer
                },
              ),
            ),
            title: Text(
              "   NEWS FOR TODAY",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.blueGrey[800],
                    size: 30,
                  ),
                  onPressed: () {
                    // account button tapped
                  },
                ),
              )
            ],
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              TabBar(tabs: myTabs),
              //tab bar view
              Expanded(
                  child: TabBarView(children: [
                //world page
                PostList(),
                //moneypage
                MoneyTab(),
                //company page
                CompanyTab(),
              ]))
            ],
          ),
        ),
      );
}
