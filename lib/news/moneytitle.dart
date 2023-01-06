import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_page/newstab/moneytab.dart';

class MoneyTitle extends StatelessWidget {
  final String moneyTitle;
  final String moneyDate;
  final moneyColor;
  final String imageName;
  final String moneygold;
  final String updown;

  final double borderRadius = 12;

  const MoneyTitle({
    super.key,
    required this.moneyTitle,
    required this.moneyDate,
    required this.moneyColor,
    required this.imageName,
    required this.moneygold,
    required this.updown,
  });

  @override
  Widget build(BuildContext) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: moneyColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          children: [
            // price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: moneyColor,
                          /*borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(borderRadius),
                                    topRight: Radius.circular(borderRadius)),*/
                        ),
                        //: EdgeInsets.all(12),
                        child: Text(
                          moneyDate,
                          style: TextStyle(
                              color: moneyColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )),
                  ],
                ),
              ],
            ),

            // donut picture
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
              child: Image.asset(
                imageName,
                height: 80,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // donut flavor
            Text(
              moneyTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            // love icon + add button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // plus button
                  Container(
                      margin: EdgeInsets.only(
                        top: 8,
                        left: 18,
                      ),
                      child: InkWell(
                        child: Text(
                          'Details',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                              fontSize: 15,
                              decoration: TextDecoration.underline),
                        ),
                        onTap: () {},
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, bottom: 10),
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.done,
                          size: 20,
                        ),
                        label: Text(""),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(left: 5),
                          textStyle: TextStyle(fontSize: 12),
                          backgroundColor: Colors.green,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, bottom: 10),
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel,
                          size: 20,
                        ),
                        label: Text(""),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(left: 5),
                          textStyle: TextStyle(fontSize: 12),
                          backgroundColor: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
