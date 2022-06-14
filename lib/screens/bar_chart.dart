import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample7 extends StatefulWidget {
  const BarChartSample7({Key? key}) : super(key: key);

  static const shadowColor = Color(0xFFCCCCCC);
  static const dataList = [
    _BarData(Colors.amber, 20.5, 'Paid'),
    _BarData(Color.fromARGB(255, 255, 101, 91), 22, 'Due'),
    _BarData(Color.fromARGB(255, 230, 149, 255), 12, 'Overdue'),
    _BarData(Color.fromARGB(255, 143, 241, 146), 20.5, 'Future'),
  ];

  @override
  State<BarChartSample7> createState() => _BarChartSample7State();
}

class _BarChartSample7State extends State<BarChartSample7> {
  BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double value,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 6,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height * .2,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceBetween,
          borderData: FlBorderData(
            show: true,
            border: const Border.symmetric(
              horizontal: BorderSide(
                color: Color(0xFFececec),
              ),
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            leftTitles: AxisTitles(),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 36,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: Text(
                        BarChartSample7.dataList[index].title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width * .04,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.bold),
                      ));
                },
              ),
            ),
            rightTitles: AxisTitles(),
            topTitles: AxisTitles(),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) => FlLine(
              color: const Color(0xFFececec),
              dashArray: null,
              strokeWidth: 1,
            ),
          ),
          barGroups: BarChartSample7.dataList.asMap().entries.map((e) {
            final index = e.key;
            final data = e.value;
            print(data.value);
            return generateBarGroup(index, data.color, data.value);
          }).toList(),
          maxY: 20,
        ),
      ),
    );
  }
}

class _BarData {
  final Color color;
  final double value;
  final String title;

  const _BarData(this.color, this.value, this.title);
}
