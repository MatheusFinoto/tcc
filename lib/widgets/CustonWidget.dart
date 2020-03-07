import 'package:flutter/material.dart';

class CustonWidget extends StatelessWidget {
  Color color;
  double width;
  double heigh;
  Widget child;

  CustonWidget({this.color, this.width, this.heigh, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigh,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.075),
            offset: Offset(10, 10),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-10.0, -10.0),
            blurRadius: 10,
          ),
        ],
      ),
      child: child,
    );
  }
}
