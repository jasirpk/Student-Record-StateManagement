import 'package:flutter/material.dart';
import 'package:studentlist_state/model/modal.dart';
import 'package:studentlist_state/screens/edit_screen.dart';

class Service {
  void deleteNotes(Notes notes) async {
    await notes.delete();
  }

  Future<void> editDialog(BuildContext context, Notes notes) async {
    TextEditingController userImageController = TextEditingController();
    TextEditingController userNameController = TextEditingController();
    TextEditingController userContactController = TextEditingController();
    TextEditingController userAgeController = TextEditingController();
    TextEditingController userRollNumberController = TextEditingController();

    userImageController.text = notes.image;
    userNameController.text = notes.userName;
    userContactController.text = notes.userContact;
    userAgeController.text = notes.userAge;
    userRollNumberController.text = notes.userRollNumber;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => Edit_Screen(
                  notes: notes,
                )));
  }
}
