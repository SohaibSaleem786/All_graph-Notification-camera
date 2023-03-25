import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';



class DoughnutChart extends StatefulWidget {
  DoughnutChart({Key? key, }) : super(key: key);

  @override
  _DoughnutChartState createState() => _DoughnutChartState();
}

class _DoughnutChartState extends State<DoughnutChart> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.black,
          //   title: const Text('DOUGHNUT CHART'),
          // ),
          body: SfCircularChart(
            backgroundColor: Colors.deepPurple[200],
            title:
            ChartTitle(text: 'Punjab Data 2022 \n (Total Customers)'),
            legend:
            Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            tooltipBehavior: _tooltipBehavior,
            series: <CircularSeries>[
              DoughnutSeries<GDPData, String>(
                dataSource: _chartData,
                pointColorMapper:(GDPData data, _) => data.color,
                xValueMapper: (GDPData data, _) => data.continent,
                yValueMapper: (GDPData data, _) => data.gdp,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
                enableTooltip: true,
              )
            ],
          ),
        )
    );
  }

  List<GDPData> getChartData() {
    List<GDPData> chartData = [
      GDPData('Multan', 1000,Colors.green),
      GDPData('Sialkot', 2490,Colors.pinkAccent),
      GDPData('Islamabad', 2900,Colors.orange),
      GDPData('Faisalabbad', 2305,Colors.red),
      GDPData('Karachi', 2488,Colors.yellow),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp,this.color);
  final String continent;
  final int gdp;
  final Color color;
}