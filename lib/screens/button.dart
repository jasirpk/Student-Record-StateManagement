import 'package:flutter/material.dart';

class Buttons_Screen extends StatelessWidget {
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
            backgroundColor: MaterialStatePropertyAll(Colors.teal),
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              // Check if an image has been selected
              if (selectedImage == null) {
                setState(() {
                  validateImage = true;
                });
              } else {
                final data = Notes(
                  image: userImagecontroller.text.toString(),
                  userName: userNamecontroller.text.toString(),
                  userContact: userContactcontroller.text.toString(),
                  userAge: userAgecontroller.text.toString(),
                  userRollNumber: userRollNumbercontroller.text.toString(),
                );
                final box = Boxes.getData();
                box.add(data);
                // data.save();
                userImagecontroller.clear();
                userNamecontroller.clear();
                userContactcontroller.clear();
                userAgecontroller.clear();
                userRollNumbercontroller.clear();

                Navigator.pop(context);
              }
            }
          },
          child: Text(
            'Save Details',
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
            backgroundColor: MaterialStatePropertyAll(Colors.red),
          ),
          onPressed: () {
            userNamecontroller.clear();
            userContactcontroller.clear();
            userAgecontroller.clear();
            userRollNumbercontroller.clear();
            userImagecontroller.clear();
            setState(() {
              selectedImage = null;
              validateImage = false;
            });
          },
          child: Text(
            'Clear',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
// import 'package:flutter/material.dart';

// class Buttons_Screen extends StatelessWidget {
//   final VoidCallback? onSavePressed;
//   final VoidCallback? onClearPressed;
//   final String saveButtonText;
//   final String clearButtonText;

//   const Buttons_Screen(
//       {super.key,
//       required this.onSavePressed,
//       required this.onClearPressed,
//       required this.saveButtonText,
//       required this.clearButtonText});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         ElevatedButton(
//           style: ButtonStyle(
//             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//               RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             backgroundColor: MaterialStateProperty.all(Colors.teal),
//           ),
//           onPressed: onSavePressed,
//           child: Text(
//             saveButtonText,
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         ElevatedButton(
//           style: ButtonStyle(
//             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//               RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             backgroundColor: MaterialStateProperty.all(Colors.red),
//           ),
//           onPressed: onClearPressed,
//           child: Text(
//             clearButtonText,
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       ],
//     );
//   }
// }
