import 'package:flutter/material.dart';

class FullscreenMessageComponent extends StatelessWidget {
  final String message;

  const FullscreenMessageComponent({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          this.message,
          style: TextStyle(fontSize: 24),
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
