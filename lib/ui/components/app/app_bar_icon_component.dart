import 'package:flutter/material.dart';

class AppBarIconComponent extends StatelessWidget {
  final IconData icon;

  const AppBarIconComponent({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        this.icon,
        size: 24,
        color: Colors.white,
      ),
    );
  }
}
