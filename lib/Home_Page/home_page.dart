import 'package:flutter/material.dart';
import 'package:flutter_material/Home_Page/Bottom_Navigation_Bar/bottom_navigation_bar.dart';
import 'package:flutter_material/Home_Page/Graph/Bar_chart/bar_chart.dart';
import 'package:flutter_material/Home_Page/Graph/Doughnut_chart/Doughnut_chat.dart';
import 'package:flutter_material/Home_Page/Graph/Line_chart/Line_chart.dart';
import 'package:flutter_material/Home_Page/Notification/notification.dart';
import 'package:flutter_material/Home_Page/Provider/data.dart';
import 'package:flutter_material/Home_Page/Provider/enums.dart';
import 'package:flutter_material/Home_Page/Provider/menu_info.dart';
import 'package:flutter_material/Home_Page/camera/camera.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems.map((currentMenuInfo) {
              return buildMenuButton(currentMenuInfo);
            }).toList(),
          ),
          VerticalDivider(
            width: 7,
            color: Colors.black12,
          ),
          Expanded(

            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget? child) {
                if (value.menuType == MenuType.Camera)
                  return camera();
                else if (value.menuType == MenuType.Notification)
                  return Notifications();
                else if (value.menuType == MenuType.Card)
                  return bottom_navigation_bar();
                else if (value.menuType == MenuType.Bar_chart)
                  return BarChart();
                else if (value.menuType == MenuType.doughnut_chart)
                  return DoughnutChart();
                else if (value.menuType == MenuType.LineChart)
                  return LineChart();
                else
                  return Container(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(text: 'Upcoming Tutorial\n'),
                          TextSpan(
                            text: value.title,
                            style: TextStyle(fontSize: 48),
                          ),
                        ],
                      ),
                    ),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfoo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget? child) {
        return MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(32))),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
          onPressed: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenu(currentMenuInfoo);
          },
          child: Column(

            children: <Widget>[
              Center(

                child: Row(
                  children: [
                    Container(

                      decoration: BoxDecoration(
                          color: Colors.black12,
                          border : Border.all(color: Colors.black,
                            width: 2,

                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      width: 75,
                      height: 75,
                      child: Center(child: Text(currentMenuInfoo.title ?? '')),
                    ),
                  ],
                ),
              ),
              // Image.asset(
              //   currentMenuInfoo.imageSource!,
              //   scale: 1.5,
              // ),
              // SizedBox(height: 16),

              // Text(
              //   currentMenuInfoo.title ?? '',
              //   ),

            ],
          ),
        );
      },
    );
  }

}
