import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

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
              image: AssetImage("assets/img/bg_splash.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.only(top: 100),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Card(
                    elevation: 2,
                    child: Image(
                      image: AssetImage('assets/img/logo.png'),
                      width: 125,
                      height: 125,
                    ),
                  ),
                  const SizedBox(
                    height: 275,
                  ),
                  const Text(
                    'Flutter Movie App',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Made by Wahyu Ramadhan',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20.0)),
                  SleekCircularSlider(
                    min: 0,
                    max: 100,
                    initialValue: 100,
                    appearance: CircularSliderAppearance(
                      size: 100,
                      infoProperties: InfoProperties(
                          mainLabelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      )),
                      customColors: CustomSliderColors(
                          dotColor: Colors.white,
                          progressBarColor: Colors.black,
                          shadowColor: Colors.white,
                          trackColor: Colors.white),
                      spinnerDuration: 10,
                      animDurationMultiplier: 1.3,
                      animationEnabled: true,
                      startAngle: 90.0,
                      angleRange: 360,
                    ),
                  ),
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
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, goToHomeScreen);
  }

  goToHomeScreen() {
    Get.off(() => const HomeScreen());
  }
}
