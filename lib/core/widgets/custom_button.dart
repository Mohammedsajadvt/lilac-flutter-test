import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent, 
        foregroundColor: const Color(0x33FFFFFF), 
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), 
          side: const BorderSide(
            color: Color(0x33FFFFFF), 
          ),
        ),
        elevation: 0, 
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white, 
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
