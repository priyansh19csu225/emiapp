import 'package:EMI/widgets/chart.dart';

import '/widgets/slider.dart';
import '/widgets/textbox.dart';
import 'package:flutter/material.dart';

class Emi extends StatefulWidget {
  const Emi({Key? key}) : super(key: key);

  @override
  State<Emi> createState() => _EmiState();
}

class _EmiState extends State<Emi> {
  int _value = 1;
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  double emi = 0;
  double monthlyRoi = 0;
  int _loanAmount = 0;
  double _totalInterest = 0;
  takeSliderValue(int value) {
    _value = value;
    print("Rec value from slider $value");
    t3.text = _value.toString();
    setState(() {});
  }

  _compute() {
    _loanAmount = int.parse(t1.text);
    int roi = int.parse(t2.text);
    int tenure = int.parse(t3.text);
    double monthlyPr = _loanAmount / tenure;
    _totalInterest = _loanAmount * (roi / 100) * (tenure / 12);
    monthlyRoi = (_totalInterest / tenure);
    String ti = _totalInterest.toStringAsFixed(3);
    _totalInterest = double.parse(ti);
    emi = monthlyRoi + monthlyPr.truncateToDouble();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextBox tb =
        TextBox(label: "Tenure ", icondata: Icons.calendar_month, tc: t3);
    tb.setFunction(takeSliderValue);
    chart ch = chart(
      principalLoan: _loanAmount.toDouble(),
      totalInterest: _totalInterest,
    );
    return Scaffold(
        appBar: AppBar(title: const Text("EMI CALCULATOR")),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextBox(
                  label: "Loan Money",
                  icondata: Icons.monetization_on_outlined,
                  tc: t1),
              TextBox(label: "ROI ", icondata: Icons.percent, tc: t2),
              tb,
              MySlider(takeSliderValue,
                  _value), //pass fn as an argument to the constructor
              ElevatedButton(
                onPressed: () {
                  _compute();
                },
                child: const Text("Compute"),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      const Text(
                        "Loan EMI:  ",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 73, 72, 72)),
                      ),
                      Text(
                        "\u20B9 $emi",
                        style:
                            const TextStyle(fontSize: 25, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      const Text(
                        "Total Interest Payable:  ",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 73, 72, 72)),
                      ),
                      Text(
                        "\u20B9 $_totalInterest",
                        style:
                            const TextStyle(fontSize: 25, color: Colors.black),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      const Text(
                        "Total Payment:  ",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 73, 72, 72)),
                      ),
                      Text(
                        "\u20B9 ${_loanAmount + _totalInterest}",
                        style:
                            const TextStyle(fontSize: 25, color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
              ch
            ],
          ),
        ));
  }
}
