import 'package:flexittest/presentation/screens/homescreen/homescreen.dart';
import 'package:flutter/material.dart';

import 'commons/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexit Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Material(
        child: Builder(builder: (BuildContext context) {
          final Size size = MediaQuery.of(context).size;
          SizeConfig.init(
            context,
            width: size.width,
            height: size.height,
            allowFontScaling: true,
          );

          return HomeScreen();
        }),
      ),
    );
  }
}
