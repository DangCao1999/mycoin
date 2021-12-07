import 'package:flutter/material.dart';
import 'package:mycoin/data/model/type_transaction.dart';

class MyDropdownButton extends StatefulWidget {
  const MyDropdownButton({Key? key, required this.changeTypeTransaction}) : super(key: key);
  final Function changeTypeTransaction;
  @override
  State<MyDropdownButton> createState() => _MyDropdownButtonState();
}


class _MyDropdownButtonState extends State<MyDropdownButton> {
     late TypeTransaction dropdownValue = TypeTransaction.buy;
  
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<TypeTransaction>(
        value: dropdownValue,
        //elevation: 16,
        //style: const TextStyle(color: Colors.deepPurple),
        onChanged: (TypeTransaction? newValue) {
          widget.changeTypeTransaction(newValue);
          setState(() {
            dropdownValue = newValue!;
          });

        },
        items: TypeTransaction.values.map<DropdownMenuItem<TypeTransaction>>((TypeTransaction value) {
          return DropdownMenuItem<TypeTransaction>(
            value: value,
            child: Text(value.toString().split(".").last.toUpperCase(), style: TextStyle(fontWeight: FontWeight.w500),),
          );
        }).toList(),
      ),
    );
  }
}