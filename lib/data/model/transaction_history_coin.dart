import 'package:mycoin/data/model/type_transaction.dart';

class TransactionHistoryCoin {
  String? idCoin;
  double? price;
  double? value;
  String? date;
  TypeTransaction typeTransaction;
  TransactionHistoryCoin(
      this.idCoin, this.price, this.value, this.typeTransaction);
}
