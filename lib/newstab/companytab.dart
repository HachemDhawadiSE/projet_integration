import 'package:flutter/material.dart';

import '../news/companytitle.dart';

class CompanyTab extends StatelessWidget {
  List companynews = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    [
      "birthday",
      "lib/images/birthday.png",
      "06/09/2022",
    ],
    [
      "Speech",
      "lib/images/reunion.png",
      "06/09/2022",
    ],
  ];

  @override
  Widget build(BuildContext) {
    return GridView.builder(
      itemCount: companynews.length,
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1.04 / 0.6,
      ),
      itemBuilder: (context, index) {
        return CompanyTitle(
          companyTitle: companynews[index][0],
          //companyColor: companynews[index][1],
          imageName: companynews[index][1],
          companyDate: companynews[index][2],
          /*moneyTitle: filesnews[index][0],
          moneyDate: filesnews[index][1],
          moneyColor: filesnews[index][2],
          imageName: filesnews[index][3],
          moneygold: filesnews[index][4],
          updown:filesnews[index][5],*/
        );
      },
    );
  }
}
