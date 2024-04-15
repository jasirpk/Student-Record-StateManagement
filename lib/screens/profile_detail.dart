import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studentlist_state/model/box.dart';
import 'package:studentlist_state/model/modal.dart';
import 'package:studentlist_state/services/provider.dart';

class ProfileDetail_Screen extends StatelessWidget {
  final Notes student;

  const ProfileDetail_Screen({Key? key, required this.student})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileDetailProvider(),
      child: _ProfileDetailScreen(
        student: student,
      ),
    );
  }
}

class _ProfileDetailScreen extends StatelessWidget {
  final Notes student;

  const _ProfileDetailScreen({required this.student});
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileDetailProvider>(
      builder: (context, provider, _) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Color.fromARGB(255, 83, 64, 112),
              title: Text(
                'See the full detail',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            body: SingleChildScrollView(
              child: ValueListenableBuilder<Box<Notes>>(
                valueListenable: Boxes.getData().listenable(),
                builder: (context, box, _) {
                  var data = box.values.toList().cast<Notes>();
                  if (data.isEmpty) {
                    return Center(
                      child: Text('No Data'),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Student's Profile",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: 250,
                              height: 220,
                              decoration: BoxDecoration(
                                border: Border.all(width: 3),
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: FileImage(
                                    File(student.image),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Name :',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                  fontSize: 20),
                            ),
                            Text(
                              student.userName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 30, right: 45),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Roll Number :',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    student.userRollNumber,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30, right: 45),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Age :',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    student.userAge,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30, right: 45),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Phone Number :',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    student.userContact,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
