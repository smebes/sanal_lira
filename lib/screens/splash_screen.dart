import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sanal_lira/core/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    runTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const Text('Splash Screen'),
      ),
    );
  }

  void runTimer() {
    Future.delayed(
      const Duration(seconds: 0),
      () {
        Navigator.of(
          context,
        ).pushReplacementNamed(
          RouteNames.loginScreenRoute,
        );
      },
    );
  }
}
