import 'package:flutter/material.dart';
import 'package:login_page/news/moneytitle.dart';

class MoneyTab extends StatelessWidget {
  List moneynews = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    [
      "wajdi Amdouni",
      "06/09/2022",
      Color.fromARGB(255, 240, 238, 238),
      "lib/images/men.jpg",
      "323,65",
      "up"
    ],
    [
      "mariem achouri",
      "06/09/2022",
      Color.fromARGB(255, 240, 238, 238),
      "lib/images/women.jpg",
      "155,29",
      "down"
    ],
  ];

  @override
  Widget build(BuildContext) {
    return GridView.builder(
      itemCount: moneynews.length,
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.04 / 1.60,
      ),
      itemBuilder: (context, index) {
        return MoneyTitle(
          moneyTitle: moneynews[index][0],
          moneyDate: moneynews[index][1],
          moneyColor: moneynews[index][2],
          imageName: moneynews[index][3],
          moneygold: moneynews[index][4],
          updown: moneynews[index][5],
        );
      },
    );
  }
}
