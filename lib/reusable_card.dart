import 'package:flutter/material.dart';
import 'package:bmi/ip_page.dart';



class ReusableCard extends StatelessWidget {

  ReusableCard({required this.colour, required this.cardchild, required this.onpress});

  final Color colour;
  final Widget cardchild;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,

      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
