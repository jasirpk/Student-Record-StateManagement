import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:studentlist_state/screens/listview.dart';

class Spalash_Screen extends StatefulWidget {
  const Spalash_Screen({super.key});

  @override
  State<Spalash_Screen> createState() => _Spalash_ScreenState();
}

class _Spalash_ScreenState extends State<Spalash_Screen> {
  @override
  void initState() {
    goToNextScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/Animation - 1711475544104.json'),
      ),
    );
  }

  Future<void> goToNextScreen(context) async {
    await Future.delayed(
      Duration(seconds: 2),
    );

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => ListView_Screen()));
  }
}
