// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentlist_state/model/modal.dart';
import 'package:studentlist_state/services/notifier_getx.dart';
import 'package:studentlist_state/widgets/button.dart';
import 'package:studentlist_state/widgets/user_age.dart';
import 'package:studentlist_state/widgets/user_contact.dart';
import 'package:studentlist_state/widgets/user_name.dart';
import 'package:studentlist_state/widgets/user_rollnumber.dart';

class Edit_Screen extends StatefulWidget {
  final Notes notes;

  const Edit_Screen({super.key, required this.notes});
  @override
  State<Edit_Screen> createState() => _Edit_ScreenState();
}

class _Edit_ScreenState extends State<Edit_Screen> {
  File? selectedImage;
  String? Imagepath;
  var formKey = GlobalKey<FormState>();
  var userNamecontroller = TextEditingController();

  var userContactcontroller = TextEditingController();

  var userAgecontroller = TextEditingController();

  var userRollNumbercontroller = TextEditingController();
  var userImagecontroller = TextEditingController();
  bool validateName = false;
  bool validateRollNumber = false;
  bool validateAge = false;
  bool validatePhoneNumber = false;
  bool validateImage = false;
  @override
  void initState() {
    super.initState();
    userImagecontroller.text = widget.notes.image;
    userNamecontroller.text = widget.notes.userName;
    userRollNumbercontroller.text = widget.notes.userRollNumber;
    userAgecontroller.text = widget.notes.userAge;
    userContactcontroller.text = widget.notes.userContact;
    selectedImage = File(widget.notes.image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 83, 64, 112),
        title: Text(
          'REMARKABLE RESULTS',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 1),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Update Student Detail',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    pickImgeFromGallery();
                  },
                  child: Stack(
                    children: [
                      Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/profile_image.jpg'),
                                fit: BoxFit.cover),
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: selectedImage != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.file(
                                    selectedImage!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : SizedBox()),
                      if (selectedImage != null)
                        Positioned(
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    selectedImage = null;
                                    userImagecontroller.text = '';
                                  });
                                },
                                icon: Icon(Icons.cancel)))
                    ],
                  ),
                ),
                SizedBox(height: 20),
                UserName_Screen(
                    userNamecontroller: userNamecontroller,
                    validateName: validateName),
                SizedBox(
                  height: 25,
                ),
                RollNumber_Screen(
                    userRollNumbercontroller: userRollNumbercontroller,
                    validateRollNumber: validateRollNumber),
                SizedBox(
                  height: 25,
                ),
                UserAge_Screen(
                    userAgecontroller: userAgecontroller,
                    validateAge: validateAge),
                SizedBox(
                  height: 25,
                ),
                Contact_Screen(
                    userContactcontroller: userContactcontroller,
                    validatePhoneNumber: validatePhoneNumber),
                SizedBox(
                  height: 25,
                ),
                Buttons_Screen(
                    onSavePressed: onUpdateRecord,
                    onClearPressed: onClearRecord,
                    saveButtonText: 'Update Details',
                    clearButtonText: 'Clear'),
                if (validateImage)
                  Text('Please select an image',
                      style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future pickImgeFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) {
      return;
    }
    setState(
      () {
        selectedImage = File(returnImage.path);
        Imagepath = returnImage.path.toString();
        userImagecontroller.text = returnImage.path;
      },
    );
  }

  void onUpdateRecord() async {
    if (formKey.currentState!.validate()) {
      // Check if an image has been selected
      if (selectedImage == null) {
        setState(() {
          validateImage = true;
        });
      } else {
        widget.notes.image = userImagecontroller.text.toString();
        widget.notes.userName = userNamecontroller.text.toString();
        widget.notes.userRollNumber = userRollNumbercontroller.text.toString();
        widget.notes.userAge = userAgecontroller.text.toString();
        widget.notes.userContact = userContactcontroller.text.toString();
        await widget.notes.save();
        Get.back();

        Get.find<ListViewController>().refresh();
      }
    }
  }

  void onClearRecord() {
    userNamecontroller.clear();
    userContactcontroller.clear();
    userAgecontroller.clear();
    userRollNumbercontroller.clear();
    userImagecontroller.clear();
    setState(() {
      selectedImage = null;
      validateImage = false;
    });
  }
}
