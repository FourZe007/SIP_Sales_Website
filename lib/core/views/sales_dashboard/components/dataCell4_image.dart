import 'package:flutter/material.dart';

class CellDashboard4Image extends StatelessWidget {
  const CellDashboard4Image({required this.textTitle});

  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 104, 126, 255),
      ),
      child: Center(
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 8,
            backgroundImage: AssetImage(textTitle),
          ),
        ),
      ),
    );
  }
}
