import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.title,
    this.textColor = Colors.white,
    this.textSize = 30,
    this.buttonColor = const Color.fromARGB(255, 22, 21, 21),
    this.onPressed,
  });

  final String title;
  final Color textColor;
  final double textSize;
  final Color buttonColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Stack(children: <Widget>[
          TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                  backgroundColor: buttonColor,
                  minimumSize: const Size(80, 80)),
              child: Center(
                  child: Text(title,
                      style: TextStyle(
                        color: textColor,
                        fontSize: textSize,
                      ))))
        ]));
  }
}
