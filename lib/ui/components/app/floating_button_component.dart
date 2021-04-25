import 'package:flutter/material.dart';

class FloatingButtonComponent extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const FloatingButtonComponent(
      {Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: FloatingActionButton(
        heroTag: UniqueKey(),
        child: Icon(
          this.icon,
          size: 32,
        ),
        onPressed: this.onTap,
      ),
    );
  }
}
