import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:studentlist_state/screens/listview.dart';

class SpalashScreen extends StatefulWidget {
  @override
  State<SpalashScreen> createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/Animation - 1711475544104.json'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  void goToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Get.off(() => ListViewScreen());
  }
}
