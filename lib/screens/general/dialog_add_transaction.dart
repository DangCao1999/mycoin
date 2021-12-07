import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mycoin/screens/general/my_dropdown_button.dart';

class DialogAddTransaction extends StatelessWidget {
  const DialogAddTransaction({Key? key}) : super(key: key);

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
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Coin',
                        hintText: 'Enter Coin symbol ex: BTC'),
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
  }
}
