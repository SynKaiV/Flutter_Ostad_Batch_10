import 'package:flutter/material.dart';

class addWaterButton extends StatelessWidget {
  final int amount;
  IconData ? icon;
  final VoidCallback onCLick;

  addWaterButton({
    super.key,
    required this.onCLick,
    required this.amount,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: onCLick,
          label: Text('+${amount} Litre',style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),),
          icon: Icon(icon ?? Icons.water_drop),
        ),
      ),
    );
  }
}