import 'package:flutter/material.dart';
class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.color, required this.percentage});
  final Color color;
  final int percentage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
              color: color.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)
          ),
        ),
        LayoutBuilder(builder: (context, constraints)=>Container(
          width: constraints.maxWidth * (percentage/100),
          height: 5,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10)
          ),
        ),)
      ],
    );
  }
}