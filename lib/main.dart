import 'package:flutter/material.dart';
import 'package:flutter_charts/horizontal_chart_page.dart';

import 'package:flutter_charts/modular_bar_chart/data/sample_data.dart';
import 'package:flutter_charts/modular_bar_chart/data/bar_chart_data.dart';
import 'package:flutter_charts/modular_bar_chart/data/bar_chart_style.dart';
import 'package:flutter_charts/modular_bar_chart/modular_bar_chart.dart';
import 'package:touchable/touchable.dart';

void main() { runApp(MyApp()); }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final ModularBarChart chartUngrouped = ModularBarChart.ungrouped(
    data: sampleData2,
    style: BarChartStyle(
      title: BarChartLabel(
        text: 'Boring Title',
        textStyle: TextStyle(color: Colors.white),
      ),
      sortXAxis: true,
      groupMargin: 5,
      xAxisStyle: AxisStyle(
        label: BarChartLabel(
          text: 'x Axis',
          textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        axisColor: Colors.teal,
        tickStyle: TickStyle(
          tickLength: 5,
          tickColor: Colors.teal,
        ),
      ),
      yAxisStyle: AxisStyle(
        numTicks: 5,
        label: BarChartLabel(
          text: 'Y Axis',
          textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
        ),
        //preferredEndValue: 20,
        axisColor: Colors.teal,
        tickStyle: TickStyle(
          tickLength: 5,
          tickColor: Colors.teal,
        ),
      ),
      barStyle: BarChartBarStyle(
        barWidth: 15,
        barInGroupMargin: 1,
      ),
      legendStyle: BarChartLegendStyle(visible: false),
    ),
  );
  final ModularBarChart chartGroupedSeparated = ModularBarChart.groupedSeparated(
    data: sampleData6,
    style: BarChartStyle(
      title: BarChartLabel(
        text: 'Boring Title',
        textStyle: TextStyle(color: Colors.white),
      ),
      sortXAxis: true,
      groupMargin: 5,
      xAxisStyle: AxisStyle(
        label: BarChartLabel(
          text: 'x Axis',
          textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        axisColor: Colors.teal,
        tickStyle: TickStyle(
          tickLength: 5,
          tickColor: Colors.teal,
        ),
      ),
      yAxisStyle: AxisStyle(
        numTicks: 5,
        label: BarChartLabel(
          text: 'Y Axis',
          textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
        ),
        //preferredEndValue: 20,
        axisColor: Colors.teal,
        tickStyle: TickStyle(
          tickLength: 5,
          tickColor: Colors.teal,
        ),
      ),
      barStyle: BarChartBarStyle(
        barWidth: 15,
        barInGroupMargin: 1,
      ),
      legendStyle: BarChartLegendStyle(visible: false),
    ),
  );
  final ModularBarChart chartGrouped = ModularBarChart.grouped(
    data: sampleData3,
    style: BarChartStyle(
      title: BarChartLabel(
        text: 'Boring Title',
        textStyle: TextStyle(color: Colors.white),
      ),
      sortXAxis: true,
      groupMargin: 5,
      // TODO Allow subgroup comparator
      xAxisStyle: AxisStyle(
        label: BarChartLabel(
          text: 'X Axis',
          textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        axisColor: Colors.teal,
        tickStyle: TickStyle(
          tickLength: 5,
          tickColor: Colors.teal,
        ),
      ),
      yAxisStyle: AxisStyle(
        numTicks: 5,
        label: BarChartLabel(
          text: 'Y Axis',
          textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
        ),
        //preferredEndValue: 20,
        axisColor: Colors.teal,
        tickStyle: TickStyle(
          tickLength: 5,
          tickColor: Colors.teal,
        ),
      ),
      barStyle: BarChartBarStyle(
        barWidth: 10,
        barInGroupMargin: 0,
      ),
    ),
  );
  final ModularBarChart chartGroupedStacked = ModularBarChart.groupedStacked(
    data: sampleData3,
    style: BarChartStyle(
      title: BarChartLabel(
        text: 'Boring Title',
        textStyle: TextStyle(color: Colors.white),
      ),
      sortXAxis: true,
      groupMargin: 5,
      xAxisStyle: AxisStyle(
        label: BarChartLabel(
          text: 'Age',
          textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        axisColor: Colors.teal,
        tickStyle: TickStyle(
          tickLength: 5,
          tickColor: Colors.teal,
        ),
      ),
      yAxisStyle: AxisStyle(
        numTicks: 5,
        label: BarChartLabel(
          text: 'Height in cm',
          textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
        ),
        //preferredEndValue: 20,
        axisColor: Colors.teal,
        tickStyle: TickStyle(
          tickLength: 5,
          tickColor: Colors.teal,
        ),
      ),
      barStyle: BarChartBarStyle(
        barWidth: 15,
        barInGroupMargin: 0,
        isStacked: true,
      ),
    ),
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charts'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                    HorizontalChartViewPage(chart: chartUngrouped.copyWith(
                      style: chartUngrouped.style.copyWith(
                        animation: BarChartAnimation(
                          animateData: true,
                        )
                      )
                    ))
                  ),
                );
              },
              child: Card(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)),),
                margin: const EdgeInsets.all(5),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: chartUngrouped,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                    HorizontalChartViewPage(chart: chartGroupedSeparated.copyWith(
                      style: chartGroupedSeparated.style.copyWith(
                        animation: BarChartAnimation(
                          animateData: true,
                        )
                      )
                    ))
                  ),
                );
              },
              child: Card(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)),),
                margin: const EdgeInsets.all(5),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: chartGroupedSeparated,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                    HorizontalChartViewPage(chart: chartGrouped.copyWith(
                      style: chartGrouped.style.copyWith(
                        animation: BarChartAnimation(
                          animateData: true,
                        )
                      )
                    ))
                  ),
                );
              },
              child: Card(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)),),
                margin: const EdgeInsets.all(5),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: chartGrouped,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                    HorizontalChartViewPage(chart: chartGroupedStacked.copyWith(
                      style: chartGroupedStacked.style.copyWith(
                        animation: BarChartAnimation(
                          animateData: true,
                        )
                      )
                    ))
                  ),
                );
              },
              child: Card(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)),),
                margin: const EdgeInsets.all(5),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: chartGroupedStacked,
                ),
              ),
            ),
            // TODO fix bug in not touchable when not in scroll view
            // Container(
            //   child: CanvasTouchDetector(
            //     builder: (BuildContext context) {
            //       return CustomPaint(
            //         painter: c(context),
            //       );
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

// TODO fix bug in not touchable when not in scroll view
class c extends CustomPainter {
  final BuildContext context;

  c(this.context);
  @override
  void paint(Canvas canvas, Size size) {
    Rect r = Rect.fromPoints(Offset(0,0), Offset(size.width, size.height));
    var ca = TouchyCanvas(context, canvas);
    ca.drawRect(r, Paint()..color = Colors.blue,
    onTapDown: (details){ print(details.globalPosition); });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
  
}