// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentlist_state/model/box.dart';
import 'package:studentlist_state/model/modal.dart';
import 'package:studentlist_state/screens/edit_screen.dart';
import 'package:studentlist_state/services/notifier_getx.dart';

class Service {
  Future<void> deleteNotes(Notes notes) async {
    final box = Boxes.getData();
    await box.delete(notes.key);

    Get.find<ListViewController>().studentList.remove(notes);

    Get.find<ListViewController>().studentList.refresh();
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
    Get.to(() => Edit_Screen(notes: notes));
  }
}

class StudentDataService extends GetxService {
  final RxList<Notes> studentList = RxList<Notes>();
}
