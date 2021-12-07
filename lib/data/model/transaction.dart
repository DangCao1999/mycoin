import 'package:mycoin/data/model/type_transaction.dart';

class TransactionCoin {
  late double valueCoin;
  late double price;
  late TypeTransaction typeTransaction;
  TransactionCoin(this.valueCoin, this.price, this.typeTransaction);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["valueCoin"] = valueCoin;
    data["price"] = price;
    data["typeTransaction"] = typeTransaction.toString();
    return data;
  }

  TransactionCoin.fromMap(Map<dynamic, dynamic> map)
      : valueCoin = map["valueCoin"],
        price = map["price"],
        typeTransaction = TypeTransaction.values.firstWhere(
            (element) => element.toString() == map["typeTransaction"]);
}
