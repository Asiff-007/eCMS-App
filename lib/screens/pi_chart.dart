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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Container(
      height: height * .012,
      width: width * .085,
      child: PieChart(
        PieChartData(
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: width * .02,
            centerSpaceRadius: width *.09,
            sections: showingSections(width)),
      ),
    );
  }

  List<PieChartSectionData> showingSections(double width) {
    return List.generate(3, (i) {
      double fontSize = width*.042;
      double radius = width*.085;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color.fromARGB(255, 48, 170, 245),
            value: 10,
            title: 'Absent',
            titlePositionPercentageOffset: width * .0052,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xffbcc0cb)),
          );
        case 1:
          return PieChartSectionData(
            color: Color.fromARGB(255, 53, 207, 112),
            value: 70,
            title: 'present',
            titlePositionPercentageOffset: width * .0052,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xffbcc0cb)),
          );
        case 2:
          return PieChartSectionData(
            color: Color.fromARGB(255, 252, 191, 106),
            value: 20,
            title: 'Late',
            titlePositionPercentageOffset: width * .0052,
            radius: radius,
            titleStyle: TextStyle(
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
