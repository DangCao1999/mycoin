import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mycoin/data/model/history_coin.dart';


class HistoryCoinRepository {
  
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  saveHistoryCoin(String uid, HistoryCoin transactionHistoryCoin) {

  }

  getAllHistoryCoin(String uid) {

  }
}
