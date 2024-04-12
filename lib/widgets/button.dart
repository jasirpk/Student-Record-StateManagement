import 'package:flutter/material.dart';

class Buttons_Screen extends StatelessWidget {
  final VoidCallback? onSavePressed;
  final VoidCallback? onClearPressed;
  final String saveButtonText;
  final String clearButtonText;

  const Buttons_Screen(
      {super.key,
      required this.onSavePressed,
      required this.onClearPressed,
      required this.saveButtonText,
      required this.clearButtonText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.teal),
          ),
          onPressed: onSavePressed,
          child: Text(
            saveButtonText,
            style: TextStyle(color: Colors.white),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          onPressed: onClearPressed,
          child: Text(
            clearButtonText,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
