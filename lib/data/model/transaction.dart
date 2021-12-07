import 'package:mycoin/data/model/type_transaction.dart';

class TransactionCoin {
  double valueCoin;
  double price;
  TypeTransaction typeTransaction;
  TransactionCoin(this.valueCoin, this.price, this.typeTransaction);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["valueCoin"] = valueCoin;
    data["price"] = price;
    data["typeTransaction"]= typeTransaction.toString();
    return data;
  }
}
