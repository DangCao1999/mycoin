import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mycoin/data/model/coin.dart';

class CardCoinTop extends StatelessWidget {
  CardCoinTop({Key? key, required this.coin}) : super(key: key);
  final Coin coin;
  bool isNegative = false;
  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,##,000');

    return Container(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            "https://s2.coinmarketcap.com/static/img/coins/64x64/${coin.id}.png",
            width: 48,
            height: 48,
          ),
          SizedBox(
              height: 100,
              width: 50,
              child: Center(child: Text(coin.symbol.toString()))),
          SizedBox(
              height: 100,
              width: 50,
              child: Center(child: buildPercentChange24h())),
          SizedBox(
              height: 100,
              width: 70,
              child: Center(
                  child: Text(
                coin.quote!.price.toStringAsFixed(2),
              ))),
          ElevatedButton(onPressed: () => {}, child: Text("Buy")),
        ],
      ),
    );
  }

  Text buildPercentChange24h() {
    var formatter = NumberFormat('#,##,000');
    double percent = coin.quote!.percentChange24h;
    TextStyle textStyle;
    if (percent < 0) {
      isNegative = true;
      textStyle = const TextStyle(color: Colors.red);
      percent *= -1;
    } else {
      textStyle = const TextStyle(color: Colors.green);
    }
    return Text(percent.toStringAsFixed(2), style: textStyle);
  }
}
