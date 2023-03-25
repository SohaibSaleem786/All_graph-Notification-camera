import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';




class BarChart extends StatefulWidget {
  BarChart({Key? key}) : super(key: key);
  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
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
          body: Center(
            child: Container(
              width: 400,
              height: 500,
              child: SfCartesianChart(
                title: ChartTitle(text: 'PROGRESSS CHART'),
                legend: Legend(isVisible: true),
                tooltipBehavior: _tooltipBehavior,
                series: <ChartSeries>[
                  BarSeries<GDPData, String>(
                      name: 'PROGRESS',
                      color: Colors.red,
                      dataSource: _chartData,
                      xValueMapper: (GDPData gdp, _) => gdp.continent,
                      yValueMapper: (GDPData gdp, _) => gdp.gdp,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                      enableTooltip: true)
                ],
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  // numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
                  title: AxisTitle(text: 'GDP in billions of PAKISTAN PKR'),
                ),
              ),
            ),
          ),
        ));
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('karachi', 1600),
      GDPData('Sialkot', 2490),
      GDPData('Islamabad', 2900),
      GDPData('Multan', 23050),
      GDPData('Fasilabad', 94880),
      GDPData('Lahore', 10000),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);

  final String continent;
  final double gdp;
}
