import 'package:flutter/material.dart';

class HomeButtonComponent extends StatelessWidget {
  final AssetImage icon;
  final String title;
  final VoidCallback onTap;

  const HomeButtonComponent({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Image(
                image: this.icon,
                width: 64,
                height: 64,
                color: Colors.white,
              ),
            ),
            Text(
              this.title,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue[800],
        ),
      ),
      onTap: this.onTap,
    );
  }
}
