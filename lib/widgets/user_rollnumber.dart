import 'package:flutter/material.dart';

class RollNumber_Screen extends StatelessWidget {
  const RollNumber_Screen({
    super.key,
    required this.userRollNumbercontroller,
    required this.validateRollNumber,
  });

  final TextEditingController userRollNumbercontroller;
  final bool validateRollNumber;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Roll number is required';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      controller: userRollNumbercontroller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.pin),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: 'Roll Number',
        errorText: validateRollNumber ? 'Roll Number Not Found !' : null,
      ),
    );
  }
}
