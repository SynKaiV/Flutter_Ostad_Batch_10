import 'package:flutter/material.dart';

class calculatorButton extends StatelessWidget {
  String text;
  Color ? color;
  final VoidCallback onClick;

  calculatorButton({
    super.key,
    this.color,
    required this.onClick,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: color ?? Colors.grey[800],
          ),
          onPressed: onClick,
          child: Text(text,style: TextStyle(
              fontSize: 30,
              color: Colors.white
          ),),
        ),
      ),
    );
  }
}