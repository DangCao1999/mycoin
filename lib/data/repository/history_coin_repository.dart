import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mycoin/data/model/transaction.dart';

class HistoryCoinRepository {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  saveTransaction(String uid, int cid, TransactionCoin transactionHistoryCoin) {
    users
        .doc(uid)
        .collection("transactionHistory")
        .doc(cid.toString())
        .set({"transaction": transactionHistoryCoin.toJson()});
  }

  getAllHistoryCoin(String uid) {}
}
