// ignore_for_file: prefer_const_constructors, constant_identifier_names, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:widget_07/widgets/custom_image.dart';

class ImagesPage extends StatelessWidget {
  static const String ROUTE = "/images";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("imagenes"),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                CustomImage(
                    rutaImagen:
                        'https://images.freeimages.com/images/large-previews/25c/abstract-flowers-2-1199959.jpg'),
                SizedBox(
                  height: 8,
                ),
                CustomImage(
                    rutaImagen:
                        'https://images.freeimages.com/images/large-previews/4ca/colours-of-nature-1173208.jpg'),
              ],
            )),
      ),
    );
  }
}
