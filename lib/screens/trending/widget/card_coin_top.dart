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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: 80,
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
                child: Center(
                    child: Text(
                  coin.symbol.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ))),
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
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ))),
            ElevatedButton(
                onPressed: () => {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.fixed,
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.orange.shade400,
                          content: Row(
                            children: [
                              Icon(
                                Icons.local_fire_department,
                                color: Colors.red,
                              ),
                              Text(
                                'Comming Soon!',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w800),
                              ),
                            ],
                          )))
                    },
                child: Text("Detail")),
          ],
        ),
      ),
    );
  }

  Text buildPercentChange24h() {
    var formatter = NumberFormat('#,##,000');
    double percent = coin.quote!.percentChange24h;
    TextStyle textStyle;
    if (percent < 0) {
      isNegative = true;
      textStyle = const TextStyle(
          color: Colors.red, fontSize: 14, fontWeight: FontWeight.w600);
      percent *= -1;
    } else {
      textStyle = const TextStyle(
          color: Colors.green, fontSize: 14, fontWeight: FontWeight.w600);
    }
    return Text(percent.toStringAsFixed(2), style: textStyle);
  }
}
