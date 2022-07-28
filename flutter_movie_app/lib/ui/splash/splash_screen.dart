import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  initScreen(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: 30,
              image: AssetImage("assets/img/bg_splash.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.only(top: 120),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Image(
                    image: AssetImage('assets/img/logo.png'),
                    width: 125,
                    height: 125,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Flutter Movie App',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Made by Wahyu Ramadhan',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                ],
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    // startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, goToHomeScreen);
  }

  goToHomeScreen() {
    Get.off(() => const HomeScreen());
  }
}
