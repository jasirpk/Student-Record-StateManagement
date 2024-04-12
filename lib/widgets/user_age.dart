import 'package:flutter/material.dart';

class UserAge_Screen extends StatelessWidget {
  const UserAge_Screen({
    super.key,
    required this.userAgecontroller,
    required this.validateAge,
  });

  final TextEditingController userAgecontroller;
  final bool validateAge;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Age is required';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      controller: userAgecontroller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.calendar_month),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: 'Age',
        errorText: validateAge ? 'Age Not Found !' : null,
      ),
    );
  }
}
