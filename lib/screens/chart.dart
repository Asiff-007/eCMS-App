import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 30,
      child: PieChart(
        PieChartData(
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 5,
            centerSpaceRadius: 30,
            sections: showingSections()),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      const fontSize = 14.0;
      const radius = 30.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 45,
            title: 'Late',
            titlePositionPercentageOffset: 1.9,
            radius: radius,
            titleStyle: const TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xffbcc0cb)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 35,
            title: 'present',
            titlePositionPercentageOffset: 1.9,
            radius: radius,
            titleStyle: const TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xffbcc0cb)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 20,
            title: 'Absent',
            titlePositionPercentageOffset: 1.9,
            radius: radius,
            titleStyle: const TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xffbcc0cb)),
          );
        default:
          throw Error();
      }
    });
  }
}
