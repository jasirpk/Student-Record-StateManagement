import 'package:flutter/material.dart';
import 'package:studentlist_state/model/modal.dart';

class ProfileDetailProvider extends ChangeNotifier {
  late Notes _student;

  // Constructor to initialize _student with default values
  ProfileDetailProvider({
    String image = '',
    String userName = '',
    String userContact = '',
    String userAge = '',
    String userRollNumber = '',
  }) {
    _student = Notes(
      image: image,
      userName: userName,
      userContact: userContact,
      userAge: userAge,
      userRollNumber: userRollNumber,
    );
  }

  Notes get student => _student;

  set student(Notes value) {
    try {
      _student = value;
      notifyListeners();
    } catch (error, stackTrace) {
      print('Error while notifying listeners: $error\n$stackTrace');
    }
  }
}
