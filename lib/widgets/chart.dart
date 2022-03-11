import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class chart extends StatelessWidget {
  late double principalLoan;
  late double totalInterest;

  chart({required double principalLoan, required double totalInterest}) {
    this.principalLoan = principalLoan;
    this.totalInterest = totalInterest;
  }

  Map<String, double> _map() {
    Map<String, double> dataMap = {
      "Principal Loan Amount": principalLoan,
      "Total Interest": totalInterest,
    };
    return dataMap;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: Center(
        child: PieChart(
          dataMap: _map(),
          chartRadius: MediaQuery.of(context).size.width,
          legendOptions:
              const LegendOptions(legendPosition: LegendPosition.right),
          chartValuesOptions: const ChartValuesOptions(
            showChartValuesInPercentage: true,
          ),
        ),
      ),
    );
  }
}
