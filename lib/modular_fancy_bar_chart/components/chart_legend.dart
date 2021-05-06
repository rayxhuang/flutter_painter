import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts/modular_fancy_bar_chart/bar_chart_data_class/bar_chart_style.dart';
import 'package:provider/provider.dart';

import 'package:flutter_charts/modular_fancy_bar_chart/bar_chart_data_class/bar_chart_data.dart';
import 'package:flutter_charts/modular_fancy_bar_chart/bar_chart_data_class/textSizeInfo.dart';

class ChartLegendHorizontal extends StatelessWidget {
  final double width;

  ChartLegendHorizontal({
    @required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final ModularBarChartData data = context.read<ModularBarChartData>();
    final BarChartStyle style = context.read<BarChartStyle>();
    final double height = getSizeOfString(data.xSubGroups.first, style.legendStyle.legendTextStyle, isHeight: true) + 4;
    double maxWidthOfOneLegend = double.negativeInfinity;
    data.xSubGroups.forEach((name) {
      double singleLegendWidth = getSizeOfString(name, style.legendStyle.legendTextStyle);
      if ( singleLegendWidth >= maxWidthOfOneLegend) { maxWidthOfOneLegend = singleLegendWidth; }
    });
    double legendWidth;
    if (maxWidthOfOneLegend * data.xSubGroups.length <= width) {
      legendWidth = width / data.xSubGroups.length;
    } else {
      int numLegendOnScreen = width ~/ 50;
      legendWidth = width / numLegendOnScreen;
    }
    return SizedBox(
      width: width,
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        itemCount: data.xSubGroups.length,
        itemBuilder: (BuildContext context, int index) {
          final String groupName = data.xSubGroups[index];
          return SizedBox(
            width: legendWidth,
            height: height,
            child: Tooltip(
              message: groupName,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.circle, color: data.subGroupColors[groupName], size: 8,),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Text(
                      groupName,
                      style: style.legendStyle.legendTextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );


    // return SizedBox(
    //   width: width,
    //   height: size.height,
    //   child: Tooltip(
    //     message: label.text,
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Icon(Icons.circle, color: color, size: 8,),
    //         SizedBox(width: 5,),
    //         Expanded(
    //           child: Text(
    //             label.text,
    //             style: label.textStyle,
    //             overflow: TextOverflow.ellipsis,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  Size size(TextStyle textStyle) => Size(width, getSizeOfString('I', textStyle, isHeight: true) + 4);

  static double getHeight(BarChartLabel label) => getSizeOfString('I', label.textStyle, isHeight: true) + 4;
}

class ChartLegendVertical extends StatelessWidget {
  final TextStyle textStyle;
  final Size parentSize;
  final double widthInPercentage;
  final double heightInPercentage;

  ChartLegendVertical({
    @required this.parentSize,
    this.widthInPercentage = 0.1,
    this.heightInPercentage = 0.7,
    this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      width: parentSize.width * widthInPercentage,
      height: parentSize.height * heightInPercentage,
    );
  }

  Size get size => Size(parentSize.width * widthInPercentage, parentSize.height * heightInPercentage);
}