import 'package:mycoin/data/model/transaction.dart';

class HistoryCoin {
  String cid;
  List<Map<String, TransactionCoin>> transaction;
  HistoryCoin(this.cid, this.transaction);
}
