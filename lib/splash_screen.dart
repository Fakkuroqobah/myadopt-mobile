import 'dart:async';

import 'package:flutter/material.dart';
import 'configs/constant.dart';

import 'screens/launcher_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LauncherPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset("${Constant.assetUrl}splash_screen.png",
        fit: BoxFit.fill);
  }
}
