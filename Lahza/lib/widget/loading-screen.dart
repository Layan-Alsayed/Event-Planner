import 'package:flutter/material.dart';
import 'home_page.dart';
import 'dart:async';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GradientBackgroundPage(),
    );
  }
}

class GradientBackgroundPage extends StatefulWidget {
  const GradientBackgroundPage({super.key});

  @override
  State<GradientBackgroundPage> createState() {
    return _GradientBackgroundPageState();
  }
}

class _GradientBackgroundPageState extends State<GradientBackgroundPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 44, 152, 252),
              Color.fromARGB(255, 115, 185, 241),
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            'images/loading-la.gif',
            width: 320,
            height: 320,
          ),
        ),
      ),
    );
  }
}
