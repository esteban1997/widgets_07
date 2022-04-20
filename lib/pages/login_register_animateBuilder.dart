// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, constant_identifier_names, avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:widget_07/widgets/custom_text_field.dart';

class LoginRegister extends StatefulWidget {
  static const String ROUTE = "/login_reguster";

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister>
    with SingleTickerProviderStateMixin {
  bool _loginView = false;
  late AnimationController _animationController;
  late Animation<Size> _heightAnimation;

  @override
  void initState() {
    //vsync es qeu comonente qiero animar, pero tiene que ser animable la clase, por eso se agrega la clase SingleTickerProviderStateMixin con with
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    //la parte <Size> corresopnde al proposito de l aclase, tween es para trabajar con vlaores progresivos
    //se pone en el eje x double.infiniti para no variar el width
    _heightAnimation = Tween<Size>(
            begin: Size(double.infinity, 300), end: Size(double.infinity, 350))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));

    _animationController.addListener(() {
      setState(() {
        print(_animationController.status);
        print(_animationController.value);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("App widgets"),
        ),
        body: AnimatedBuilder(
          animation: _animationController,
          builder: (_, widget) {
            return Container(
              //height: _loginView ? 300 : 350,
              height: _heightAnimation.value.height,
              margin: EdgeInsets.all(8),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CumtomTextField(
                        icon: Icons.person,
                        placeholder: "Usuario Prueba",
                        primaryColorBorder: Colors.red,
                        accentColorFocused: Colors.orange,
                      ),
                      SizedBox(height: 8),
                      CumtomTextField(
                        isObscureText: true,
                        icon: Icons.lock,
                        placeholder: "Password",
                        primaryColorBorder: Colors.red,
                        accentColorFocused: Colors.orange,
                      ),
                      SizedBox(height: 8),
                      Visibility(
                        visible: !_loginView,
                        child: CumtomTextField(
                          isObscureText: true,
                          icon: Icons.lock,
                          placeholder: "Confirmar Password",
                          primaryColorBorder: Colors.red,
                          accentColorFocused: Colors.orange,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor),
                        onPressed: () {},
                        child: Text(
                          _loginView ? "Login" : "Registrarse",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Spacer(),
                      SwitchListTile(
                          title: Text(
                            _loginView ? "Login" : "Registrarse",
                          ),
                          value: _loginView,
                          onChanged: (value) {
                            _loginView = value;
                            if (!_loginView) {
                              _animationController.forward();
                            } else {
                              _animationController.reverse();
                            }
                            setState(() {});
                          })
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
