import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:moodtrack/Reusable_Code/BarData.dart';

class Bargraph extends StatefulWidget {
  final List moodcount;

  const Bargraph({super.key, required this.moodcount});

  @override
  State<Bargraph> createState() => _BargraphState();
}

class _BargraphState extends State<Bargraph> {
  @override
  Widget build(BuildContext context) {
    BarData barData = BarData(
      sunAmount: widget.moodcount[0],
      monAmount: widget.moodcount[1],
      tueAmount: widget.moodcount[2],
      wedAmount: widget.moodcount[3],
      thuAmount: widget.moodcount[4],
      friAmount: widget.moodcount[5],
    );

    barData.initializeBarData();

    return BarChart(
      BarChartData(
        maxY: 10,
        minY: 0,
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                return getBottomTitles(value, meta, context); // Pass context
              },
            ),
          ),
        ),
        barGroups: barData.barData
            .map((data) => BarChartGroupData(
          x: data.x,
          barRods: [
            BarChartRodData(
              toY: data.y,
              color: Colors.red,
              width: 25,
              borderRadius: BorderRadius.circular(3),
            ),
          ],
        ))
            .toList(),
        gridData: FlGridData(show: false),
      ),
    );
  }

  Widget getBottomTitles(double value, TitleMeta meta, BuildContext context) {
    final List<String> imagePaths = [
      "",
      'images/great.png',
      'images/goodd.png',
      'images/normal.png',
      'images/bad.png',
      'images/awful.png',
      'images/angry.png',
    ];

    Widget imageWidget;

    if (value.toInt() >= 0 && value.toInt() < imagePaths.length) {
      imageWidget = SizedBox( // Use SizedBox to control size
        width: 70,  // Set desired width
        height: 70, // Set desired height
        child: Image.asset(
       // Set desired width
          height: 70,
          width: 70,
          imagePaths[value.toInt()],
      // Important for proper scaling within SizedBox
        ),
      );
    } else {
      imageWidget = const Text("error");
    }

    return SideTitleWidget(
      meta: meta,

      child: imageWidget,
    );
  }
}