import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:studentlist_state/screens/listview.dart';

class SpalashScreen extends StatelessWidget {
  SpalashScreen({Key? key}) : super(key: key) {
    goToNextScreen();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/Animation - 1711475544104.json'),
      ),
    );
  }

  void goToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Get.off(() => ListViewScreen());
  }
}
