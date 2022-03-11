import 'package:flutter/material.dart';

class MySlider extends StatelessWidget {
  Function fn;
  int value;
  MySlider(this.fn, this.value);

  @override
  Widget build(BuildContext context) {
    print("Value Rec From Parent  $value");
    return Container(
      child: Slider(
        value: value.toDouble(), // current value
        min: 1,
        max: 12,
        onChanged: (double value) {
          fn(value.toInt());
        },
      ),
    );
  }
}
