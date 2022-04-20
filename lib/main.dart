// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:widget_07/pages/box2_page.dart';
import 'package:widget_07/pages/box_page.dart';
import 'package:widget_07/pages/images_page.dart';
import 'package:widget_07/pages/login_register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: ImagesPage.ROUTE,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.red,
      ),
      routes: {
        LoginRegister.ROUTE: ((_) => LoginRegister()),
        BoxPage.ROUTE: ((_) => BoxPage()),
        Box2Page.ROUTE: ((_) => Box2Page()),
        ImagesPage.ROUTE: ((_) => ImagesPage())
      },
    );
  }
}
