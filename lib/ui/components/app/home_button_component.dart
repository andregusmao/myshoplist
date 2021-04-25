import 'package:flutter/material.dart';

class HomeButtonComponent extends StatelessWidget {
  final IconData icon;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Icon(
                this.icon,
                size: 48,
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
