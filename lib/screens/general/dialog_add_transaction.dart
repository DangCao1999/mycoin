import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycoin/cubit/coinDTO/coindto_cubit.dart';
import 'package:mycoin/cubit/history_coin/history_coin_cubit.dart';
import 'package:mycoin/data/dto/coin_dto.dart';
import 'package:mycoin/data/model/transaction.dart';
import 'package:mycoin/data/model/type_transaction.dart';
import 'package:mycoin/data/repository/history_coin_repository.dart';
import 'package:mycoin/screens/general/bottom_sheet_search_coin.dart';
import 'package:mycoin/screens/general/my_dropdown_button.dart';

class DialogAddTransaction extends StatefulWidget {
  const DialogAddTransaction({Key? key}) : super(key: key);

  @override
  State<DialogAddTransaction> createState() => _DialogAddTransactionState();
}

class _DialogAddTransactionState extends State<DialogAddTransaction> {
  TextEditingController controllerCoinSymbol = TextEditingController();
  TextEditingController controllerValue = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();

  TypeTransaction typeTransactionChoose = TypeTransaction.buy;
  late int cid;
  changeTypeTransactionChoose(TypeTransaction typeTransaction) {
    typeTransactionChoose = typeTransaction;
  }

  saveClick(BuildContext context) {
    print(controllerCoinSymbol.text);
    print(controllerPrice.text);
    print(controllerValue.text);
    print(typeTransactionChoose.toString());

    TransactionCoin transactionCoin = TransactionCoin(
        double.parse(controllerValue.text),
        double.parse(controllerPrice.text),
        typeTransactionChoose);
    BlocProvider.of<HistoryCoinCubit>(context)
        .saveHistoryCoin("1", cid, transactionCoin);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.grey.shade50,
        child: SizedBox(
          height: 380,
          child: Column(
            children: [
              Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.blue.shade800,
                  child: const Center(
                      child: Text(
                    "Add transaction",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ))),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: controllerCoinSymbol,
                        readOnly: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Coin',
                            hintText: 'Enter Coin symbol ex: BTC'),
                        onTap: () async {
                          CoinDTO? coinDTO =
                              await showModalBottomSheet<CoinDTO>(
                                  // context and builder are
                                  // required properties in this widget
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext _) {
                                    // we set up a container inside which
                                    // we create center column and display text
                                    return BlocProvider.value(
                                        value: BlocProvider.of<CoinDTOCubit>(
                                            context),
                                        child: BottomSheetSearchCoin());
                                  });
                          if (coinDTO != null) {
                            controllerCoinSymbol.text =
                                coinDTO.symbol.toString();
                            cid = coinDTO.id!;
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: controllerValue,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Value Coin',
                            hintText: 'Enter Value Coin'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: controllerPrice,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Price Avg',
                            hintText: 'Enter Price Avg'),
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                      width: double.infinity,
                      child: MyDropdownButton(
                        changeTypeTransaction: changeTypeTransactionChoose,
                      )),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () => {
                      saveClick(context)
                    },
                    child: const Text("Save",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
