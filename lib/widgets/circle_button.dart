import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  late final IconData icon;
  late final double size;
  late final VoidCallback onPressed;

  CircleButton(
      {required this.icon, required this.size, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.0),
      decoration:
          BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
      child: IconButton(
          onPressed: this.onPressed,
          icon: Icon(
            this.icon,
            size: this.size,
            color: Colors.black,
          )),
    );
  }
}
