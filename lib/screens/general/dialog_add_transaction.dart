import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycoin/cubit/coinDTO/coindto_cubit.dart';
import 'package:mycoin/data/dto/coin_dto.dart';
import 'package:mycoin/screens/general/bottom_sheet_search_coin.dart';
import 'package:mycoin/screens/general/my_dropdown_button.dart';

class DialogAddTransaction extends StatefulWidget {
  final CoinDTOCubit coinDTOCubit;
  const DialogAddTransaction({Key? key, required this.coinDTOCubit})
      : super(key: key);

  @override
  State<DialogAddTransaction> createState() => _DialogAddTransactionState();
}

class _DialogAddTransactionState extends State<DialogAddTransaction> {
  @override
  void initState() {
    // TODO: implement initState
    // if(widget.coinDTOCubit.state is CoinDTOInitial)
    // {
    //   widget.coinDTOCubit.getAllCoins();
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinDTOCubit, CoinDTOState>(
      builder: (context, state) {
        if(state is CoinDTOInitial)
        {
          print("ok");
        }
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
                            readOnly: true,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Coin',
                                hintText: 'Enter Coin symbol ex: BTC'),
                            onTap: () {
                              showModalBottomSheet<void>(
                                  // context and builder are
                                  // required properties in this widget
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext _) {
                                    // we set up a container inside which
                                    // we create center column and display text
                                     return  BlocProvider.value(
                                       value: BlocProvider.of<CoinDTOCubit>(context),
                                       child: BottomSheetSearchCoin());
                                  });
                            },
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Value Coin',
                                hintText: 'Enter Value Coin'),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Price Avg',
                                hintText: 'Enter Price Avg'),
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                          width: double.infinity,
                          child: const MyDropdownButton()),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () => {},
                        child: const Text("Save",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }
}
