import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';




class LineChart extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  LineChart({Key? key}) : super(key: key);

  @override
  _LineChartState createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  List<_SalesData> data = [
    _SalesData('Jan', 75),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40),
    _SalesData('Jun', 72)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   title:  Text('LINE CHART'),
      // ),
      body:
      Padding(

        padding:  EdgeInsets.only(left: 20),
        child: SingleChildScrollView(
          child: Column(

              children: [
                //Initialize the chart widget
                SfCartesianChart(

                    primaryXAxis: CategoryAxis(),
                    // Chart title
                    title: ChartTitle(text:'Clint#01 sales analysis'),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<_SalesData, String>>[
                      LineSeries<_SalesData, String>(
                          dataSource: data,
                          xValueMapper: (_SalesData sales, _) => sales.year,
                          yValueMapper: (_SalesData sales, _) => sales.sales,
                          name: 'Sales',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true))
                    ]),
                SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    // Chart title
                    title: ChartTitle(text: 'Clint#02 sales analysis'),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<_SalesData, String>>[
                      LineSeries<_SalesData, String>(
                          dataSource: data,
                          xValueMapper: (_SalesData sales, _) => sales.year,
                          yValueMapper: (_SalesData sales, _) => sales.sales,
                          name: 'Sales',
                          color: Colors.red,
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true))
                    ]),
                SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    // Chart title
                    title: ChartTitle(text: 'Clint#03 sales analysis'),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<_SalesData, String>>[
                      LineSeries<_SalesData, String>(
                          dataSource: data,
                          xValueMapper: (_SalesData sales, _) => sales.year,
                          yValueMapper: (_SalesData sales, _) => sales.sales,
                          name: 'Sales',
                          color: Colors.orange,
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true))
                    ]),
                SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    // Chart title
                    title: ChartTitle(text: 'Clint#04 sales analysis'),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<_SalesData, String>>[
                      LineSeries<_SalesData, String>(
                          dataSource: data,
                          xValueMapper: (_SalesData sales, _) => sales.year,
                          yValueMapper: (_SalesData sales, _) => sales.sales,
                          name: 'Sales',
                          color: Colors.green,
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true))
                    ]),
                SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    // Chart title
                    title: ChartTitle(text: 'Clint#05 sales analysis'),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<_SalesData, String>>[
                      LineSeries<_SalesData, String>(
                          dataSource: data,
                          xValueMapper: (_SalesData sales, _) => sales.year,
                          yValueMapper: (_SalesData sales, _) => sales.sales,
                          name: 'Sales',
                          color: Colors.purple,
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true))
                    ]),
                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     //Initialize the spark charts widget
                //     child: SfSparkLineChart.custom(
                //       //Enable the trackball
                //       trackball: SparkChartTrackball(
                //           activationMode: SparkChartActivationMode.tap),
                //       //Enable marker
                //       marker: SparkChartMarker(
                //           displayMode: SparkChartMarkerDisplayMode.all),
                //       //Enable data label
                //       labelDisplayMode: SparkChartLabelDisplayMode.all,
                //       xValueMapper: (int index) => data[index].year,
                //       yValueMapper: (int index) => data[index].sales,
                //       dataCount: 5,
                //     ),
                //   ),
                // )
              ]),
        ),
      ),

    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}