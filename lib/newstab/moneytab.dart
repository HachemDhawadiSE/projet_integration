import 'package:flutter/material.dart';
import 'package:login_page/news/moneytitle.dart';

class MoneyTab extends StatelessWidget {
  List moneynews = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    [
      "Bitcoin",
      "06/09/2022",
      Colors.yellow,
      "lib/images/bitcoin.png",
      "323,65",
      "up"
    ],
    [
      "Etherium",
      "06/09/2022",
      Colors.blue,
      "lib/images/ethereum.png",
      "155,29",
      "down"
    ],
    ["Tether", "06/09/2022", Colors.green, "lib/images/tether.png", "101,65","down"],
    ["Bnb", "06/09/2022", Colors.yellow, "lib/images/bnb.png", "80,89","down"],
    ["Usd", "06/09/2022", Colors.purple, "lib/images/usd.png", "77,15","down"],
    ["Coin", "06/09/2022", Colors.yellow, "lib/images/coin.png", "64,21","up"],
    ["Xrp", "06/09/2022", Colors.blue, "lib/images/xrp.png", "107,5","up"],
    ["Cardano", "06/09/2022", Colors.blue, "lib/images/cardano.png", "60,3","down"],
    [
      "Dogecoin",
      "06/09/2022",
      Colors.yellow,
      "lib/images/dogecoin.png",
      "58,6",
      "up"
    ],
    [
      "Polygon",
      "06/09/2022",
      Colors.purple,
      "lib/images/polygon.png",
      "100",
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
        childAspectRatio: 1.04 / 1.35,
      ),
      itemBuilder: (context, index) {
        return MoneyTitle(
          moneyTitle: moneynews[index][0],
          moneyDate: moneynews[index][1],
          moneyColor: moneynews[index][2],
          imageName: moneynews[index][3],
          moneygold: moneynews[index][4],
          updown:moneynews[index][5],
        );
      },
    );
  }
}
