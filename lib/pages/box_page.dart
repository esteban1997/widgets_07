// ignore_for_file: prefer_const_constructors, constant_identifier_names, use_key_in_widget_constructors, library_prefixes

import 'dart:math' as Math;
import 'package:flutter/material.dart';

class BoxPage extends StatefulWidget {
  static const String ROUTE = "/box";

  @override
  State<BoxPage> createState() => _BoxPageState();
}

class _BoxPageState extends State<BoxPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation, _rotationAnimation, _opacityAnimation;
  late Animation<Offset> _translateAnimate;

  //late Animatable<Color> _backgroundAnimate;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    _sizeAnimation = Tween<double>(begin: 1.0, end: 3.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0, 0.25, curve: Curves.linear)));

    _rotationAnimation = Tween<double>(begin: 0.0, end: 2.5 * Math.pi).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.25, 0.5, curve: Curves.linear)));

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.5).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.5, 0.75, curve: Curves.linear)));

    _translateAnimate =
        Tween<Offset>(begin: Offset.zero, end: Offset(20.0, 50.0)).animate(
            CurvedAnimation(
                parent: _animationController,
                curve: Interval(0.75, 1, curve: Curves.linear)));

    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (_animationController.status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    //colores
    /*_backgroundAnimate = TweenSequence<Color>([
      TweenSequenceItem(
          weight: 1.0, tween: Tween(begin: Colors.red, end: Colors.green)),
      TweenSequenceItem(
          weight: 1.0, tween: Tween(begin: Colors.green, end: Colors.blue)),
      TweenSequenceItem(
          weight: 1.0, tween: Tween(begin: Colors.blue, end: Colors.red))
    ]);*/

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();

    return Scaffold(
        appBar: AppBar(
          title: Text("cuadrado animado"),
        ),
        body: Center(
          child: AnimatedBuilder(
            animation: _animationController,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(color: Colors.blue),
            ),
            builder: (_, Widget? widget) {
              if (widget != null) {
                //transfor no esta atado a una animacion solo es un cambio entre valores
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: Transform.translate(
                    offset: _translateAnimate.value,
                    child: Transform.rotate(
                      angle: _rotationAnimation.value,
                      child: Transform.scale(
                          scale: _sizeAnimation.value, child: widget),
                    ),
                  ),
                );
              } else {
                return Text("no hay widget");
              }
            },
          ),
        ));
  }
}
