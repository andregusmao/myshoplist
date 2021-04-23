import 'package:flutter/material.dart';

class AppBarIconComponent extends StatelessWidget {
  final String iconPath;

  const AppBarIconComponent({Key? key, required this.iconPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image(
        image: AssetImage(this.iconPath),
        width: 24,
        color: Colors.white,
      ),
    );
  }
}
