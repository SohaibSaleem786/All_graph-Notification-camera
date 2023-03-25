import 'package:flutter/material.dart';
import 'package:flutter_material/Home_Page/Provider/enums.dart';
import 'package:flutter_material/Home_Page/Provider/menu_info.dart';
import 'package:flutter_material/Home_Page/home_page.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;


void main() {


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
        create: (context) {
          return MenuInfo(MenuType.Camera);
        },
        child: MyHomePage(),
      ),
    );
  }
}

