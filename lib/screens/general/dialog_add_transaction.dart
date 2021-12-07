import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mycoin/screens/general/my_dropdown_button.dart';

class DialogAddTransaction extends StatelessWidget {
  const DialogAddTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'One';
    return Dialog(
        child: Container(
      height: 320,
      child: Column(
        children: [
          Container( 
            height: 50,
            width: double.infinity,
            color: Colors.blue.shade800,
            child: const Center(child: Text("Add transaction"))),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Value Coin',
                      hintText: 'Enter Value Coin'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Price Avg',
                      hintText: 'Enter Price Avg'),
                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                  width: double.infinity,
                  child: const MyDropdownButton()),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () => {},
                    child: const Text("Buy"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => {},
                    child: const Text("Sell"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    ));
  }
}
