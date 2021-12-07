import 'package:mycoin/data/model/type_transaction.dart';

class Transaction {
  double valueCoin;
  double price;
  TypeTransaction typeTransaction;
  Transaction(this.valueCoin, this.price, this.typeTransaction);
}
