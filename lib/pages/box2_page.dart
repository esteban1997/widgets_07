// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_final_fields, constant_identifier_names, library_prefixes

import 'package:flutter/material.dart';
import 'dart:math' as Math;

class Box2Page extends StatefulWidget {
  static const String ROUTE = "/box2";

  @override
  State<Box2Page> createState() => _Box2PageState();
}

class _Box2PageState extends State<Box2Page> {
  double _width = 50, _height = 50;
  Color _color = Colors.purple;
  BorderRadius _borderRadius = BorderRadius.circular(8);
  Offset _offset = Offset(1.55, 2.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.update),
          onPressed: () {
            final random = Math.Random();

            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();
            _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                random.nextInt(256), random.nextDouble());
            _offset = Offset(
                random.nextInt(15).toDouble(), random.nextInt(15).toDouble());
            setState(() {});
          },
        ),
        appBar: AppBar(
          title: Text("Animated Container"),
        ),
        body: Center(
          child: AnimatedContainer(
            decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
                boxShadow: [BoxShadow(offset: _offset, color: Colors.black)]),
            width: _width,
            height: _height,
            duration: Duration(milliseconds: 200),
            child: Text("lo que sea"),
          ),
        ));
  }
}
