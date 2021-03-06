import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  late String label;
  late IconData icondata;
  late TextEditingController tc;
  late Function fn;
  setFunction(Function fn) {
    this.fn = fn;
  }

  TextBox({
    required String label,
    required IconData icondata,
    required TextEditingController tc,
  }) {
    this.label = label;
    this.icondata = icondata;
    this.tc = tc;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: (String value) {
          if (fn != null) {
            fn(int.parse(value));
          }
        },
        controller: tc,
        decoration: InputDecoration(
            label: Text(label),
            hintText: 'Type $label',
            suffixIcon: Icon(icondata),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
