import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppLaunchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () => Modular.to.navigate('/home'));
    return Container(
      color: Colors.blue[700],
      alignment: Alignment.center,
      child: Text(
        'My Shoplist',
        style: TextStyle(
          fontSize: 32,
          color: Colors.white,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
