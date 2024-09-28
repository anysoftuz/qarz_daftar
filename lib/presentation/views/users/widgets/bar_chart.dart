import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:qarz_daftar/data/models/home/graphic_statistics_model.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/icons.dart';
import 'package:qarz_daftar/utils/log_service.dart';

class BarChartSample2 extends StatefulWidget {
  const BarChartSample2({super.key, required this.graphicStatistics});
  final Color leftBarColor = mainBlue;
  final Color rightBarColor = red;
  final Color avgColor = red;
  final List<GraphicStatisticsModel> graphicStatistics;
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  ValueNotifier<bool> valueNotifier = ValueNotifier(false);
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  @override
  void initState() {
    super.initState();
    final List<BarChartGroupData> items = [];
    for (var i = 0; i < 7; i++) {
      // if (i < widget.graphicStatistics.length) {
      //   final index1 = widget.graphicStatistics[i].statistics.isNotEmpty
      //       ? widget.graphicStatistics[i].statistics.first.amount
      //       : 0;
      //   final index2 = widget.graphicStatistics[i].statistics.length == 2
      //       ? widget.graphicStatistics[i].statistics[1].amount
      //       : 0;
      //   items.add(makeGroupData(i, index1.toDouble(), index2.toDouble()));
      // }
      items.add(makeGroupData(i, 0, 0));
    }
    Log.e(items);
    rawBarGroups = items;
    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Statistics',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              ValueListenableBuilder(
                  valueListenable: valueNotifier,
                  builder: (context, value, __) {
                    return TextButton(
                      onPressed: () {
                        valueNotifier.value = !value;
                      },
                      child: Row(
                        children: [
                          Text(
                            value ? "USD" : "UZS",
                            style: const TextStyle(color: mainBlue),
                          ),
                          AppIcons.arrowDown.svg(color: mainBlue)
                        ],
                      ),
                    );
                  }),
              // TextButton(
              //   onPressed: () {},
              //   child: Row(
              //     children: [
              //       const Text("Weekly", style: TextStyle(color: mainBlue)),
              //       AppIcons.arrowDown.svg(color: mainBlue)
              //     ],
              //   ),
              // ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BarChart(
              BarChartData(
                maxY: 20,
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: ((group) {
                      return Colors.grey;
                    }),
                    getTooltipItem: (a, b, c, d) => null,
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: bottomTitles,
                      reservedSize: 42,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 1,
                      getTitlesWidget: leftTitles,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: showingBarGroups,
                gridData: const FlGridData(show: false),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 5) {
      text = '100';
    } else if (value == 10) {
      text = '200';
    } else if (value == 15) {
      text = '300';
    } else if (value == 19) {
      text = '400';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>[
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun',
    ];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: widget.leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: widget.rightBarColor,
          width: width,
        ),
      ],
    );
  }
}
