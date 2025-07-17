import 'package:flutter/material.dart';
import 'package:flutter_custom_animated_auth_ui/shapes/wave_clipper.dart';
import 'package:flutter_custom_animated_auth_ui/shapes/wave_painter.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              //color: Colors.grey,
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  width: width,
                  height: height * 0.35,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.blue],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
