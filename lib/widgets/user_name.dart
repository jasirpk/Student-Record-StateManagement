import 'package:flutter/material.dart';

class UserName_Screen extends StatelessWidget {
  const UserName_Screen({
    super.key,
    required this.userNamecontroller,
    required this.validateName,
  });

  final TextEditingController userNamecontroller;
  final bool validateName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Name is required';
        }
        return null;
      },
      controller: userNamecontroller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: 'Name',
        errorText: validateName ? 'Name Not Found !' : null,
      ),
    );
  }
}
