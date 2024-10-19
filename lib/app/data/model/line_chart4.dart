import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HeadCircumferenceChart extends StatelessWidget {
  final List<List<FlSpot>> percentileSpots = [
    // -3 SD
    [FlSpot(0, 31.5), FlSpot(6, 39), FlSpot(12, 43), FlSpot(18, 45), FlSpot(24, 46)],
    // -2 SD
    [FlSpot(0, 33), FlSpot(6, 41), FlSpot(12, 45), FlSpot(18, 47), FlSpot(24, 48)],
    // -1 SD
    [FlSpot(0, 34.5), FlSpot(6, 42.5), FlSpot(12, 46.5), FlSpot(18, 48.5), FlSpot(24, 49.5)],
    // 0 SD (median)
    [FlSpot(0, 36), FlSpot(6, 44), FlSpot(12, 48), FlSpot(18, 50), FlSpot(24, 51)],
    // +1 SD
    [FlSpot(0, 37.5), FlSpot(6, 45.5), FlSpot(12, 49.5), FlSpot(18, 51.5), FlSpot(24, 52.5)],
    // +2 SD
    [FlSpot(0, 39), FlSpot(6, 47), FlSpot(12, 51), FlSpot(18, 53), FlSpot(24, 54)],
    // +3 SD
    [FlSpot(0, 40.5), FlSpot(6, 48.5), FlSpot(12, 52.5), FlSpot(18, 54.5), FlSpot(24, 55.5)],
  ];

  final List<Color> lineColors = [
    Colors.black,  // -3 SD
    Colors.red,    // -2 SD
    Colors.orange, // -1 SD
    Colors.green,  // 0 SD (median)
    Colors.orange, // +1 SD
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
            minY: 30,
            maxY: 56,
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
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    return Text(value.toInt().toString(), style: TextStyle(fontSize: 10));
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 2,
                  getTitlesWidget: (value, meta) {
                    if (value == 0) return Text('Birth', style: TextStyle(fontSize: 10));
                    if (value == 12) return Text('1 year', style: TextStyle(fontSize: 10));
                    if (value == 24) return Text('2 years', style: TextStyle(fontSize: 10));
                    return Text(value.toInt().toString(), style: TextStyle(fontSize: 10));
                  },
                ),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            gridData: FlGridData(
              show: true,
              drawHorizontalLine: true,
              drawVerticalLine: true,
              horizontalInterval: 1,
              verticalInterval: 2,
              getDrawingHorizontalLine: (value) {
                return FlLine(color: Colors.grey.withOpacity(0.3), strokeWidth: 1);
              },
              getDrawingVerticalLine: (value) {
                return FlLine(color: Colors.grey.withOpacity(0.3), strokeWidth: 1);
              },
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



// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class LineChartModel4 extends StatelessWidget {
//   LineChartModel4({
//     super.key,
//     Color? line1Color1,
//     Color? line1Color2,
//     Color? line2Color1,
//     Color? line2Color2,
//   })  : line1Color1 = line1Color1 ?? Colors.orangeAccent,
//         line1Color2 = line1Color2 ?? Colors.orange,
//         line2Color1 = line2Color1 ?? Colors.blueAccent,
//         line2Color2 = line2Color2 ?? Colors.blue {
//     minSpotX = spots.first.x;
//     maxSpotX = spots.first.x;
//     minSpotY = spots.first.y;
//     maxSpotY = spots.first.y;

//     for (final spot in spots) {
//       if (spot.x > maxSpotX) {
//         maxSpotX = spot.x;
//       }

//       if (spot.x < minSpotX) {
//         minSpotX = spot.x;
//       }

//       if (spot.y > maxSpotY) {
//         maxSpotY = spot.y;
//       }

//       if (spot.y < minSpotY) {
//         minSpotY = spot.y;
//       }
//     }
//   }

//   final Color line1Color1;
//   final Color line1Color2;
//   final Color line2Color1;
//   final Color line2Color2;

//   final spots = const [
//     FlSpot(0, 1),
//     FlSpot(2, 5),
//     FlSpot(4, 3),
//     FlSpot(6, 5),
//   ];

//   final spots2 = const [
//     FlSpot(0, 3),
//     FlSpot(2, 1),
//     FlSpot(4, 2),
//     FlSpot(6, 1),
//   ];

//   late double minSpotX;
//   late double maxSpotX;
//   late double minSpotY;
//   late double maxSpotY;

//   Widget leftTitleWidgets(double value, TitleMeta meta) {
//     final style = TextStyle(
//       color: line1Color1,
//       fontWeight: FontWeight.bold,
//       fontSize: 18,
//     );

//     final intValue = reverseY(value, minSpotY, maxSpotY).toInt();

//     if (intValue == (maxSpotY + minSpotY)) {
//       return Text('', style: style);
//     }

//     return Padding(
//       padding: const EdgeInsets.only(right: 6),
//       child: Text(
//         intValue.toString(),
//         style: style,
//         textAlign: TextAlign.center,
//       ),
//     );
//   }

//   Widget rightTitleWidgets(double value, TitleMeta meta) {
//     final style = TextStyle(
//       color: line2Color2,
//       fontWeight: FontWeight.bold,
//       fontSize: 18,
//     );
//     final intValue = reverseY(value, minSpotY, maxSpotY).toInt();

//     if (intValue == (maxSpotY + minSpotY)) {
//       return Text('', style: style);
//     }

//     return Text(intValue.toString(), style: style, textAlign: TextAlign.right);
//   }

//   Widget topTitleWidgets(double value, TitleMeta meta) {
//     if (value % 1 != 0) {
//       return Container();
//     }
//     const style = TextStyle(
//       fontWeight: FontWeight.bold,
//       color: Colors.pinkAccent,
//     );
//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       child: Text(value.toInt().toString(), style: style),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 22, bottom: 20),
//       child: AspectRatio(
//         aspectRatio: 2,
//         child: LineChart(
//           LineChartData(
//             lineTouchData: LineTouchData(
//               touchTooltipData: LineTouchTooltipData(
//                 tooltipRoundedRadius: 0,
//                 getTooltipColor: (spot) => Colors.white,
//                 getTooltipItems: (List<LineBarSpot> touchedSpots) {
//                   return touchedSpots.map((LineBarSpot touchedSpot) {
//                     return LineTooltipItem(
//                       touchedSpot.y.toString(),
//                       TextStyle(
//                         color: touchedSpot.bar.gradient!.colors.first,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                       ),
//                     );
//                   }).toList();
//                 },
//               ),
//               getTouchedSpotIndicator: (
//                 _,
//                 indicators,
//               ) {
//                 return indicators
//                     .map((int index) => const TouchedSpotIndicatorData(
//                           FlLine(color: Colors.transparent),
//                           FlDotData(show: false),
//                         ))
//                     .toList();
//               },
//               touchSpotThreshold: 12,
//               distanceCalculator:
//                   (Offset touchPoint, Offset spotPixelCoordinates) =>
//                       (touchPoint - spotPixelCoordinates).distance,
//             ),
//             lineBarsData: [
//               LineChartBarData(
//                 gradient: LinearGradient(
//                   colors: [
//                     line1Color1,
//                     line1Color2,
//                   ],
//                 ),
//                 spots: reverseSpots(spots, minSpotY, maxSpotY),
//                 isCurved: true,
//                 isStrokeCapRound: true,
//                 barWidth: 10,
//                 belowBarData: BarAreaData(
//                   show: false,
//                 ),
//                 dotData: FlDotData(
//                   show: true,
//                   getDotPainter: (spot, percent, barData, index) {
//                     return FlDotCirclePainter(
//                       radius: 12,
//                       color: Color.lerp(
//                         line1Color1,
//                         line1Color2,
//                         percent / 100,
//                       )!,
//                       strokeColor: Colors.white,
//                       strokeWidth: 1,
//                     );
//                   },
//                 ),
//               ),
//               LineChartBarData(
//                 gradient: LinearGradient(
//                   colors: [
//                     line2Color1,
//                     line2Color2,
//                   ],
//                 ),
//                 spots: reverseSpots(spots2, minSpotY, maxSpotY),
//                 isCurved: true,
//                 isStrokeCapRound: true,
//                 barWidth: 10,
//                 belowBarData: BarAreaData(
//                   show: false,
//                 ),
//                 dotData: FlDotData(
//                   show: true,
//                   getDotPainter: (spot, percent, barData, index) {
//                     return FlDotCirclePainter(
//                       radius: 12,
//                       color: Color.lerp(
//                         line2Color1,
//                         line2Color2,
//                         percent / 100,
//                       )!,
//                       strokeColor: Colors.white,
//                       strokeWidth: 1,
//                     );
//                   },
//                 ),
//               ),
//             ],
//             minY: 0,
//             maxY: maxSpotY + minSpotY,
//             titlesData: FlTitlesData(
//               leftTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   showTitles: true,
//                   getTitlesWidget: leftTitleWidgets,
//                   reservedSize: 38,
//                 ),
//               ),
//               rightTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   showTitles: true,
//                   getTitlesWidget: rightTitleWidgets,
//                   reservedSize: 30,
//                 ),
//               ),
//               bottomTitles: const AxisTitles(
//                 sideTitles: SideTitles(showTitles: false),
//               ),
//               topTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   showTitles: true,
//                   reservedSize: 32,
//                   getTitlesWidget: topTitleWidgets,
//                 ),
//               ),
//             ),
//             gridData: FlGridData(
//               show: true,
//               drawVerticalLine: true,
//               checkToShowHorizontalLine: (value) {
//                 final intValue = reverseY(value, minSpotY, maxSpotY).toInt();

//                 if (intValue == (maxSpotY + minSpotY).toInt()) {
//                   return false;
//                 }

//                 return true;
//               },
//             ),
//             borderData: FlBorderData(
//               show: true,
//               border: const Border(
//                 left: BorderSide(color: Colors.pinkAccent),
//                 top: BorderSide(color: Colors.pinkAccent),
//                 bottom: BorderSide(color: Colors.transparent),
//                 right: BorderSide(color: Colors.transparent),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   double reverseY(double y, double minX, double maxX) {
//     return (maxX + minX) - y;
//   }

//   List<FlSpot> reverseSpots(List<FlSpot> inputSpots, double minY, double maxY) {
//     return inputSpots.map((spot) {
//       return spot.copyWith(y: (maxY + minY) - spot.y);
//     }).toList();
//   }
// }