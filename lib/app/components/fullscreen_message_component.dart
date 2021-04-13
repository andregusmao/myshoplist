import 'package:flutter/material.dart';

class FullscreenMessageComponent extends StatelessWidget {
  final String message;

  const FullscreenMessageComponent({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              this.message,
              style: TextStyle(fontSize: 24),
            )
          ],
        )
      ],
    );
  }
}
