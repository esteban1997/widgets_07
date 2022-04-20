// ignore_for_file: deprecated_member_use, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CumtomTextField extends StatelessWidget {
  late final String placeholder;
  late final IconData icon;
  late final Color? primaryColorBorder;
  late final Color? accentColorFocused;
  late final bool isObscureText;

  CumtomTextField({
    required this.placeholder,
    required this.icon,
    this.primaryColorBorder,
    this.accentColorFocused,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscureText,
      decoration: InputDecoration(
        hintText: placeholder,
        prefixIcon: Icon(icon),
        contentPadding: EdgeInsets.only(top: 14),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: primaryColorBorder ?? Theme.of(context).primaryColor,
                width: 2.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: accentColorFocused ?? Theme.of(context).accentColor,
                width: 2.0)),
      ),
    );
  }
}
