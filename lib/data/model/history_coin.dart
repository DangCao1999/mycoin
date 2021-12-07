import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mycoin/data/model/transaction.dart';
import 'package:mycoin/data/model/type_transaction.dart';

class HistoryCoin {
  late String cid;
  late double totalMoney;
  late double totalValue;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["totalMoney"] = totalMoney;
    data["totalValue"] = totalValue;
    data["transaction"] = transaction.map((e) => e.toJson());
    return data;
  }

  HistoryCoin.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) :
    cid = snapshot.id,
    totalMoney= double.parse(snapshot["totalMoney"].toString()),
    totalValue = double.parse(snapshot["totalValue"].toString()),
    transaction = List.from(snapshot["transaction"]);
    // ["transaction"].forEach((e) => TransactionCoin.fromMap(e));
  
}
