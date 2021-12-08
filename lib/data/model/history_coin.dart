import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mycoin/data/model/transaction.dart';
import 'package:mycoin/data/model/type_transaction.dart';

class HistoryCoin {
  late String cid;
  late String symbolCoin;
  late double totalMoney;
  late double totalValue;
  late double profit;
  late List<TransactionCoin> transaction;
  HistoryCoin(this.cid, this.transaction);

  calculateMoneyAndValue() {
    totalMoney = 0;
    totalValue = 0;
    for (var t in transaction) {
      {
        if (t.typeTransaction == TypeTransaction.buy) {
          totalMoney += t.price;
          totalValue += t.valueCoin;
        } else {
          totalMoney -= t.price;
          totalValue -= t.valueCoin;
        }
      }
    }
  }

  calculateProfit(double newPrice){
    double totalNewPrice = totalValue * newPrice;
    profit = totalNewPrice - totalMoney;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["totalMoney"] = totalMoney;
    data["totalValue"] = totalValue;
    data["transaction"] = transaction.map((e) => e.toJson());
    return data;
  }

  HistoryCoin.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    cid = snapshot.id;
    symbolCoin = snapshot["symbolCoin"];
    totalMoney = double.parse(snapshot["totalMoney"].toString());
    totalValue = double.parse(snapshot["totalValue"].toString());
    transaction = <TransactionCoin>[];
    snapshot["transaction"]
        .forEach((e) => transaction.add(TransactionCoin.fromMap(e)));
  }
}
