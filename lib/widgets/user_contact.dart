import 'package:flutter/material.dart';

class Contact_Screen extends StatelessWidget {
  const Contact_Screen({
    super.key,
    required this.userContactcontroller,
    required this.validatePhoneNumber,
  });

  final TextEditingController userContactcontroller;
  final bool validatePhoneNumber;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Contact is required';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      controller: userContactcontroller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.contacts),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: 'Phone Number',
        errorText: validatePhoneNumber ? 'Phone Number Not Found !' : null,
      ),
    );
  }
}
