import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: PaddingApp.p16, horizontal: PaddingApp.p32),
      child: AspectRatio(
        aspectRatio: 10 / 5,
        child: DChartBarO(
          animate: true,
          measureAxis: const MeasureAxis(
            desiredMaxTickCount: 10,
            desiredMinTickCount: 5,
            showLine: false,
          ),
          // layoutMargin: LayoutMargin(10, 10, 10, 10),
          groupList: [
            OrdinalGroup(
              chartType: ChartType.scatterPlot,
              color: ColorManager.grayForSearch,
              // chartType: ChartType.line,
              id: '1',
              data: [
                OrdinalData(domain: 'Sat', measure: 5),
                OrdinalData(domain: 'Fri', measure: 6),
                OrdinalData(domain: 'Thu', measure: 2),
                OrdinalData(domain: 'Wed', measure: 8),
                OrdinalData(domain: 'Tue', measure: 3),
                OrdinalData(domain: 'Mon', measure: 1),
                OrdinalData(domain: 'Sun', measure: 4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
