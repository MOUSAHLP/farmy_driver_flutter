import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';

class Chart extends StatelessWidget {
  final Map<String, int> data;
  const Chart({Key? key, required this.data}) : super(key: key);

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
                  ...List.generate(
                    data.length,
                    (index) => OrdinalData(
                      domain: data.keys.toList()[index],
                      measure: data[data.keys.toList()[index]] as num,
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
