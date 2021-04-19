import 'package:flutter/material.dart';

class SimpleButtonComponent extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const SimpleButtonComponent({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Container(
        width: double.maxFinite,
        height: 32,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              this.text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      onPressed: this.onTap,
    );
  }
}
