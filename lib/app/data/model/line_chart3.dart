import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HeightByAgeChart extends StatelessWidget {
  final List<List<FlSpot>> percentileSpots = [
    // -3 SD
    [FlSpot(0, 65), FlSpot(12, 71), FlSpot(24, 79)],
    // -2 SD
    [FlSpot(0, 68), FlSpot(12, 75), FlSpot(24, 84)],
    // 0 SD (median)
    [FlSpot(0, 74), FlSpot(12, 82), FlSpot(24, 92)],
    // +2 SD
    [FlSpot(0, 80), FlSpot(12, 89), FlSpot(24, 100)],
    // +3 SD
    [FlSpot(0, 83), FlSpot(12, 93), FlSpot(24, 105)],
  ];

  final List<Color> lineColors = [
    Colors.black,  // -3 SD
    Colors.red,    // -2 SD
    Colors.green,  // 0 SD (median)
    Colors.red,    // +2 SD
    Colors.black,  // +3 SD
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: LineChart(
          LineChartData(
            minX: 0,
            maxX: 24,
            minY: 65,
            maxY: 105,
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
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  interval: 5,
                  getTitlesWidget: (value, meta) {
                    return Text(value.toInt().toString(), style: TextStyle(fontSize: 10));
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    if (value == 0) return Text('Birth', style: TextStyle(fontSize: 10));
                    if (value == 12) return Text('1 year', style: TextStyle(fontSize: 10));
                    if (value == 24) return Text('2 years', style: TextStyle(fontSize: 10));
                    return Text('');
                  },
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  interval: 5,
                  getTitlesWidget: (value, meta) {
                    return Text(value.toInt().toString(), style: TextStyle(fontSize: 10));
                  },
                ),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            gridData: FlGridData(
              show: true,
              drawHorizontalLine: true,
              drawVerticalLine: true,
              horizontalInterval: 5,
              verticalInterval: 1,
              getDrawingHorizontalLine: (value) {
                return FlLine(color: Colors.grey.withOpacity(0.3), strokeWidth: 1);
              },
              getDrawingVerticalLine: (value) {
                return FlLine(color: Colors.grey.withOpacity(0.3), strokeWidth: 1);
              },
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.blue, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}







// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class LineChartModel3 extends StatefulWidget {
//   LineChartModel3({super.key});

//   final Color dark = Colors.cyan;
//   final Color normal = Colors.cyan.shade400;
//   final Color light = Colors.cyanAccent.shade700;

//   @override
//   State<StatefulWidget> createState() => LineChartModel3State();
// }

// class LineChartModel3State extends State<LineChartModel3> {
//   Widget bottomTitles(double value, TitleMeta meta) {
//     const style = TextStyle(fontSize: 10);
//     String text;
//     switch (value.toInt()) {
//       case 0:
//         text = 'Apr';
//         break;
//       case 1:
//         text = 'May';
//         break;
//       case 2:
//         text = 'Jun';
//         break;
//       case 3:
//         text = 'Jul';
//         break;
//       case 4:
//         text = 'Aug';
//         break;
//       default:
//         text = '';
//         break;
//     }
//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       child: Text(text, style: style),
//     );
//   }

//   Widget leftTitles(double value, TitleMeta meta) {
//     if (value == meta.max) {
//       return Container();
//     }
//     const style = TextStyle(
//       fontSize: 10,
//     );
//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       child: Text(
//         meta.formattedValue,
//         style: style,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1.66,
//       child: Padding(
//         padding: const EdgeInsets.only(top: 16),
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             final barsSpace = 4.0 * constraints.maxWidth / 400;
//             final barsWidth = 8.0 * constraints.maxWidth / 400;
//             return BarChart(
//               BarChartData(
//                 alignment: BarChartAlignment.center,
//                 barTouchData: BarTouchData(
//                   enabled: false,
//                 ),
//                 titlesData: FlTitlesData(
//                   show: true,
//                   bottomTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       reservedSize: 28,
//                       getTitlesWidget: bottomTitles,
//                     ),
//                   ),
//                   leftTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       reservedSize: 40,
//                       getTitlesWidget: leftTitles,
//                     ),
//                   ),
//                   topTitles: const AxisTitles(
//                     sideTitles: SideTitles(showTitles: false),
//                   ),
//                   rightTitles: const AxisTitles(
//                     sideTitles: SideTitles(showTitles: false),
//                   ),
//                 ),
//                 gridData: FlGridData(
//                   show: true,
//                   checkToShowHorizontalLine: (value) => value % 10 == 0,
//                   getDrawingHorizontalLine: (value) => FlLine(
//                     color: Colors.blueAccent,
//                     strokeWidth: 1,
//                   ),
//                   drawVerticalLine: false,
//                 ),
//                 borderData: FlBorderData(
//                   show: false,
//                 ),
//                 groupsSpace: barsSpace,
//                 barGroups: getData(barsWidth, barsSpace),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   List<BarChartGroupData> getData(double barsWidth, double barsSpace) {
//     return [
//       BarChartGroupData(
//         x: 0,
//         barsSpace: barsSpace,
//         barRods: [
//           BarChartRodData(
//             toY: 17000000000,
//             rodStackItems: [
//               BarChartRodStackItem(0, 2000000000, widget.dark),
//               BarChartRodStackItem(2000000000, 12000000000, widget.normal),
//               BarChartRodStackItem(12000000000, 17000000000, widget.light),
//             ],
//             borderRadius: BorderRadius.zero,
//             width: barsWidth,
//           ),
//           BarChartRodData(
//             toY: 24000000000,
//             rodStackItems: [
//               BarChartRodStackItem(0, 13000000000, widget.dark),
//               BarChartRodStackItem(13000000000, 14000000000, widget.normal),
//               BarChartRodStackItem(14000000000, 24000000000, widget.light),
//             ],
//             borderRadius: BorderRadius.zero,
//             width: barsWidth,
//           ),
//           BarChartRodData(
//             toY: 23000000000.5,
//             rodStackItems: [
//               BarChartRodStackItem(0, 6000000000.5, widget.dark),
//               BarChartRodStackItem(6000000000.5, 18000000000, widget.normal),
//               BarChartRodStackItem(18000000000, 23000000000.5, widget.light),
//             ],
//             borderRadius: BorderRadius.zero,
//             width: barsWidth,
//           ),
//           BarChartRodData(
//             toY: 29000000000,
//             rodStackItems: [
//               BarChartRodStackItem(0, 9000000000, widget.dark),
//               BarChartRodStackItem(9000000000, 15000000000, widget.normal),
//               BarChartRodStackItem(15000000000, 29000000000, widget.light),
//             ],
//             borderRadius: BorderRadius.zero,
//             width: barsWidth,
//           ),
//           BarChartRodData(
//             toY: 32000000000,
//             rodStackItems: [
//               BarChartRodStackItem(0, 2000000000.5, widget.dark),
//               BarChartRodStackItem(2000000000.5, 17000000000.5, widget.normal),
//               BarChartRodStackItem(17000000000.5, 32000000000, widget.light),
//             ],
//             borderRadius: BorderRadius.zero,
//             width: barsWidth,
//           ),
//         ],
//       ),
//       BarChartGroupData(
//         x: 1,
//         barsSpace: barsSpace,
//         barRods: [
//           BarChartRodData(
//             toY: 31000000000,
//             rodStackItems: [
//               BarChartRodStackItem(0, 11000000000, widget.dark),
//               BarChartRodStackItem(11000000000, 18000000000, widget.normal),
//               BarChartRodStackItem(18000000000, 31000000000, widget.light),
//             ],
//             borderRadius: BorderRadius.zero,
//             width: barsWidth,
//           ),
//           BarChartRodData(
//             toY: 35000000000,
//             rodStackItems: [
//               BarChartRodStackItem(0, 14000000000, widget.dark),
//               BarChartRodStackItem(14000000000, 27000000000, widget.normal),
//               BarChartRodStackItem(27000000000, 35000000000, widget.light),
//             ],
//             borderRadius: BorderRadius.zero,
//             width: barsWidth,
//           ),
//           BarChartRodData(
//             toY: 31000000000,
//             rodStackItems: [
//               BarChartRodStackItem(0, 8000000000, widget.dark),
//               BarChartRodStackItem(8000000000, 24000000000, widget.normal),
//               BarChartRodStackItem(24000000000, 31000000000, widget.light),
//             ],
//             borderRadius: BorderRadius.zero,
//             width: barsWidth,
//           ),
//           BarChartRodData(
//             toY: 15000000000,
//             rodStackItems: [
//               BarChartRodStackItem(0, 6000000000.5, widget.dark),
//               BarChartRodStackItem(6000000000.5, 12000000000.5, widget.normal),
//               BarChartRodStackItem(12000000000.5, 15000000000, widget.light),
//             ],
//             borderRadius: BorderRadius.zero,
//             width: barsWidth,
//           ),
//           BarChartRodData(
//             toY: 17000000000,
//             rodStackItems: [
//               BarChartRodStackItem(0, 9000000000, widget.dark),
//               BarChartRodStackItem(9000000000, 15000000000, widget.normal),
//               BarChartRodStackItem(15000000000, 17000000000, widget.light),
//             ],
//             borderRadius: BorderRadius.zero,
//             width: barsWidth,
//           ),
//         ],
//       ),
//       BarChartGroupData(
//         x: 2,
//         barsSpace: barsSpace,
//         barRods: [
//           BarChartRodData(
//             toY: 34000000000,
//             rodStackItems: [
//               BarChartRodStackItem(0, 6000000000, widget.dark),
//               BarChartRodStackItem(6000000000, 23000000000, widget.normal),
//               BarChartRodStackItem(23000000000, 34000000000, widget.light),
//             ],
//             borderRadius: BorderRadius.zero,
//             width: barsWidth,
//           ),
//           BarChartRodData(
//             toY: 32000000000,
//             rodStackItems: [
//               BarChartRodStackItem(0, 7000000000, widget.dark),
//               BarChartRodStackItem(7000000000, 24000000000, widget.normal),
//               BarChartRodStackItem(24000000000, 32000000000, widget.light),
//             ],
//             borderRadius: BorderRadius.zero,
//             width: barsWidth,
//           ),
//           BarChartRodData(
//             toY: 14000000000.5,
//             rodStackItems: [
//               BarChartRodStackItem(0, 1000000000.5, widget.dark),
//               BarChartRodStackItem(1000000000.5, 12000000000, widget.normal),
//               BarChartRodStackItem(12000000000, 14000000000.5, widget.light),
//             ],
//             borderRadius: BorderRadius.zero,
//             width: barsWidth,
//           ),
//           BarChartRodData(
//             toY: 20000000000,
//             rodStackItems: [
//               BarChartRodStackItem(0, 4000000000, widget.dark),
//               BarChartRodStackItem(4000000000, 15000000000, widget.normal),
//               BarChartRodStackItem(15000000000, 20000000000, widget.light),
//             ],
//             borderRadius: BorderRadius.zero,
//             width: barsWidth,
//           ),
//           BarChartRodData(
//             toY: 24000000000,
//             rodStackItems: [
//               BarChartRodStackItem(0, 4000000000, widget.dark),
//               BarChartRodStackItem(4000000000, 15000000000, widget.normal),
//               BarChartRodStackItem(15000000000, 24000000000, widget.light),
//             ],
//             borderRadius: BorderRadius.zero,
//             width: barsWidth,
//           ),
//         ],
//       ),
//       BarChartGroupData(
//         x: 3,
//         barsSpace: barsSpace,
//         barRods: [
//           BarChartRodData(
//             toY: 14000000000,
//             rodStackItems: [
//               BarChartRodStackItem(0, 1000000000.5, widget.dark),
//               BarChartRodStackItem(1000000000.5, 12000000000, widget.normal),
//               BarChartRodStackItem(12000000000, 14000000000, widget.light),
//             ],
//             borderRadius: BorderRadius.zero,
//             width: barsWidth,
//           ),
//           BarChartRodData(
//             toY: 27000000000,
//             rodStackItems: [
//               BarChartRodStackItem(0, 7000000000, widget.dark),
//               BarChartRodStackItem(7000000000, 25000000000, widget.normal),
//               BarChartRodStackItem(25000000000, 27000000000, widget.light),
//             ],
//             borderRadius: BorderRadius.zero,
//             width: barsWidth,
//           ),
//           BarChartRodData(
//             toY: 29000000000,
//             rodStackItems: [
//               BarChartRodStackItem(0, 6000000000, widget.dark),
//               BarChartRodStackItem(6000000000, 23000000000, widget.normal),
//               BarChartRodStackItem(23000000000, 29000000000, widget.light),
//             ],
//             borderRadius: BorderRadius.zero,
//             width: barsWidth,
//           ),
//           BarChartRodData(
//             toY: 16000000000.5,
//             rodStackItems: [
//               BarChartRodStackItem(0, 9000000000, widget.dark),
//               BarChartRodStackItem(9000000000, 15000000000, widget.normal),
//               BarChartRodStackItem(15000000000, 16000000000.5, widget.light),
//             ],
//             borderRadius: BorderRadius.zero,
//             width: barsWidth,
//           ),
//           BarChartRodData(
//             toY: 15000000000,
//             rodStackItems: [
//               BarChartRodStackItem(0, 7000000000, widget.dark),
//               BarChartRodStackItem(7000000000, 12000000000.5, widget.normal),
//               BarChartRodStackItem(12000000000.5, 15000000000, widget.light),
//             ],
//             borderRadius: BorderRadius.zero,
//             width: barsWidth,
//           ),
//         ],
//       ),
//     ];
//   }
// }