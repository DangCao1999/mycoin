import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mycoin/data/model/history_coin.dart';
import 'package:mycoin/data/model/transaction.dart';

class HistoryCoinRepository {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  saveTransaction(
      String uid, int cid, TransactionCoin transactionHistoryCoin) async {
    var data = await users
        .doc(uid)
        .collection("transactionHistory")
        .doc(cid.toString())
        .get();
    if (data.exists) {
      users.doc(uid).collection("transactionHistory").doc(cid.toString()).set({
        "transaction": FieldValue.arrayUnion([transactionHistoryCoin.toJson()])
      });
    } else {
      users.doc(uid).collection("transactionHistory").doc(cid.toString()).set({
        "transaction": [transactionHistoryCoin.toJson()]
      });
    }
  }

  Future<List<HistoryCoin>> getAllHistoryCoin(String uid) async {
    List<HistoryCoin> list = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await users.doc(uid).collection("transactionHistory").get();
    for (var e in querySnapshot.docs) {
      //tran
      list.add(HistoryCoin.fromSnapshot(e));

      //print(Type(e.data()["transaction"]);
    }
    return list;
  }
}
