// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class CustomImage extends StatefulWidget {
  final String rutaImagen;
  const CustomImage({required this.rutaImagen});

  @override
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _aligmnentAnimation;

  late NetworkImage _image;

  @override
  void initState() {
    _image = NetworkImage(widget.rutaImagen);

    _image
        .resolve(ImageConfiguration())
        .addListener(ImageStreamListener((_, call) {
      _animationController.forward();
    }));

    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));

    _aligmnentAnimation = Tween<double>(begin: -1.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: FadeInImage(
            fit: BoxFit.cover,
            alignment: Alignment(_aligmnentAnimation.value, 0),
            width: 200,
            height: 200,
            placeholder: AssetImage('assets/images/load.jpg'),
            image: _image,
          ),
        );
      },
      /*child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: FadeInImage(
          fit: BoxFit.cover,
          alignment: Alignment(-1.0, 0),
          width: 200,
          height: 200,
          placeholder: AssetImage('assets/images/load.jpg'),
          image: NetworkImage(rutaImagen),
        ),
      ),*/
    );
  }
}
