import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentlist_state/model/box.dart';
import 'package:studentlist_state/model/modal.dart';
import 'package:studentlist_state/widgets/button.dart';
import 'package:studentlist_state/widgets/user_age.dart';
import 'package:studentlist_state/widgets/user_contact.dart';
import 'package:studentlist_state/widgets/user_name.dart';
import 'package:studentlist_state/widgets/user_rollnumber.dart';

class Add_Deatails_Screen extends StatefulWidget {
  const Add_Deatails_Screen({super.key});

  @override
  State<Add_Deatails_Screen> createState() => _Add_Deatails_ScreenState();
}

class _Add_Deatails_ScreenState extends State<Add_Deatails_Screen> {
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
                  'Add Student Detail',
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
                    onSavePressed: onSaveRecord,
                    onClearPressed: onClearRecord,
                    saveButtonText: 'Save Details',
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

  void onSaveRecord() {
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
