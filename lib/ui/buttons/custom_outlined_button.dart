import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({super.key, required this.onPressed, required this.text, this.color = Colors.blue, this.isFilled = false});

  final Function onPressed;
  final String text;
  final Color color;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        side: WidgetStateProperty.all(BorderSide(color: color)),
      ),
      
      onPressed: ()=> onPressed(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          text,
          style: TextStyle( fontSize: 16),
        ),
        
        ),
    );
  }
}