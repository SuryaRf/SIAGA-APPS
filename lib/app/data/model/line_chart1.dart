// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:siaga/app/data/const/font.dart';


// class LineChartModel1 extends StatelessWidget {
//   LineChartModel1({
//     super.key,
//     Color? line1Color,
//     Color? line2Color,
//     Color? betweenColor,
//   })  : line1Color = line1Color ?? Colors.greenAccent,
//         line2Color = line2Color ?? Colors.pinkAccent,
//         betweenColor =
//             betweenColor ?? Colors.redAccent.withOpacity(0.5);

//   final Color line1Color;
//   final Color line2Color;
//   final Color betweenColor;

//   Widget bottomTitleWidgets(double value, TitleMeta meta) {
//     const style = TextStyle(
//       fontSize: 10,
//       fontWeight: FontWeight.bold,
//     );
//     String text;
//     switch (value.toInt()) {
//       case 0:
//         text = 'Jan';
//         break;
//       case 1:
//         text = 'Feb';
//         break;
//       case 2:
//         text = 'Mar';
//         break;
//       case 3:
//         text = 'Apr';
//         break;
//       case 4:
//         text = 'May';
//         break;
//       case 5:
//         text = 'Jun';
//         break;
//       case 6:
//         text = 'Jul';
//         break;
//       case 7:
//         text = 'Aug';
//         break;
//       case 8:
//         text = 'Sep';
//         break;
//       case 9:
//         text = 'Oct';
//         break;
//       case 10:
//         text = 'Nov';
//         break;
//       case 11:
//         text = 'Dec';
//         break;
//       default:
//         return Container();
//     }

//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       space: 4,
//       child: Text(text, style: style),
//     );
//   }

//   Widget leftTitleWidgets(double value, TitleMeta meta) {
//     const style = TextStyle(fontSize: 10);

//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       child: Text(
//         '\$ ${value + 0.5}',
//         style: style,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 2,
//       child: Padding(
//         padding: const EdgeInsets.only(
//           left: 10,
//           right: 18,
//           top: 10,
//           bottom: 4,
//         ),
//         child: LineChart(
//           LineChartData(
//             lineTouchData: const LineTouchData(enabled: false),
//             lineBarsData: [
//               LineChartBarData(
//                 spots: const [
//                   FlSpot(0, 4),
//                   FlSpot(1, 3.5),
//                   FlSpot(2, 4.5),
//                   FlSpot(3, 1),
//                   FlSpot(4, 4),
//                   FlSpot(5, 6),
//                   FlSpot(6, 6.5),
//                   FlSpot(7, 6),
//                   FlSpot(8, 4),
//                   FlSpot(9, 6),
//                   FlSpot(10, 6),
//                   FlSpot(11, 7),
//                 ],
//                 isCurved: true,
//                 barWidth: 2,
//                 color: line1Color,
//                 dotData: const FlDotData(
//                   show: false,
//                 ),
//               ),
//               LineChartBarData(
//                 spots: const [
//                   FlSpot(0, 7),
//                   FlSpot(1, 3),
//                   FlSpot(2, 4),
//                   FlSpot(3, 2),
//                   FlSpot(4, 3),
//                   FlSpot(5, 4),
//                   FlSpot(6, 5),
//                   FlSpot(7, 3),
//                   FlSpot(8, 1),
//                   FlSpot(9, 8),
//                   FlSpot(10, 1),
//                   FlSpot(11, 3),
//                 ],
//                 isCurved: false,
//                 barWidth: 2,
//                 color: line2Color,
//                 dotData: const FlDotData(
//                   show: false,
//                 ),
//               ),
//             ],
//             betweenBarsData: [
//               BetweenBarsData(
//                 fromIndex: 0,
//                 toIndex: 1,
//                 color: betweenColor,
//               )
//             ],
//             minY: 0,
//             borderData: FlBorderData(
//               show: false,
//             ),
//             titlesData: FlTitlesData(
//               bottomTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   showTitles: true,
//                   interval: 1,
//                   getTitlesWidget: bottomTitleWidgets,
//                 ),
//               ),
//               leftTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   showTitles: true,
//                   getTitlesWidget: leftTitleWidgets,
//                   interval: 1,
//                   reservedSize: 36,
//                 ),
//               ),
//               topTitles: const AxisTitles(
//                 sideTitles: SideTitles(showTitles: false),
//               ),
//               rightTitles: const AxisTitles(
//                 sideTitles: SideTitles(showTitles: false),
//               ),
//             ),
//             gridData: FlGridData(
//               show: true,
//               drawVerticalLine: false,
//               horizontalInterval: 1,
//               checkToShowHorizontalLine: (double value) {
//                 return value == 1 || value == 6 || value == 4 || value == 5;
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChart1 extends StatelessWidget {
  final List<List<FlSpot>> percentileSpots = [
    // -3 SD
    [FlSpot(65, 5.9), FlSpot(75, 7.9), FlSpot(85, 10.1), FlSpot(95, 12.4), FlSpot(105, 14.8)],
    // -2 SD
    [FlSpot(65, 6.4), FlSpot(75, 8.5), FlSpot(85, 10.8), FlSpot(95, 13.3), FlSpot(105, 15.8)],
    // -1 SD
    [FlSpot(65, 6.9), FlSpot(75, 9.2), FlSpot(85, 11.7), FlSpot(95, 14.3), FlSpot(105, 17.0)],
    // Median
    [FlSpot(65, 7.5), FlSpot(75, 9.9), FlSpot(85, 12.6), FlSpot(95, 15.4), FlSpot(105, 18.3)],
    // +1 SD
    [FlSpot(65, 8.1), FlSpot(75, 10.8), FlSpot(85, 13.7), FlSpot(95, 16.7), FlSpot(105, 19.8)],
    // +2 SD
    [FlSpot(65, 8.8), FlSpot(75, 11.7), FlSpot(85, 14.8), FlSpot(95, 18.1), FlSpot(105, 21.5)],
    // +3 SD
    [FlSpot(65, 9.6), FlSpot(75, 12.7), FlSpot(85, 16.1), FlSpot(95, 19.7), FlSpot(105, 23.4)],
  ];

  final List<Color> lineColors = [
    Colors.red,    // -3 SD
    Colors.orange, // -2 SD
    Colors.yellow, // -1 SD
    Colors.green,  // Median
    Colors.yellow, // +1 SD
    Colors.orange, // +2 SD
    Colors.red,    // +3 SD
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: LineChart(
          LineChartData(
            minX: 65,
            maxX: 105,
            minY: 5,
            maxY: 25,
            lineBarsData: List.generate(percentileSpots.length, (index) {
              return LineChartBarData(
                spots: percentileSpots[index],
                isCurved: true,
                color: lineColors[index],
                barWidth: 2,
                isStrokeCapRound: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              );
            }),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    return Text(value.toInt().toString(), style: TextStyle(fontSize: 10));
                  },
                  reservedSize: 30,
                  interval: 5,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    return Text(value.toInt().toString(), style: TextStyle(fontSize: 10));
                  },
                  reservedSize: 30,
                  interval: 2,
                ),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            gridData: FlGridData(
              show: true,
              drawHorizontalLine: true,
              drawVerticalLine: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(color: Colors.grey.withOpacity(0.3), strokeWidth: 1);
              },
              getDrawingVerticalLine: (value) {
                return FlLine(color: Colors.grey.withOpacity(0.3), strokeWidth: 1);
              },
              horizontalInterval: 2,
              verticalInterval: 5,
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.black, width: 1),
            ),
          ),
        ),
      ),
    );
  }
}







