import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_custom_animated_auth_ui/shapes/bg_curve_painter.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _slideController;
  late AnimationController _fadeController;

  late Animation<double> _animation;
  // late Animation<double> _animation2;
  late Animation<double> _fadeAnimation;

  late Animation<Offset> _slideAnimation;
  // late Animation<Offset> _slideAnimation2;
  // late Animation<Offset> _slideAnimation3;
  late Animation<Offset> _slideAnimation4;

  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  late String otp = _controllers.map((e) => e.text).join();

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = AnimationController(
  //     vsync: this,
  //     duration: const Duration(seconds: 2),
  //   )..repeat(reverse: true);
  //   _animation = Tween<double>(
  //     begin: 0,
  //     end: 1.0,
  //   ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  // }

  @override
  void initState() {
    super.initState();

    // Wave animation controller (looping)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    // Slide animation for UI elements
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    // Fade animation for last text
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    _animation = Tween<double>(
      begin: 0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Interval(0.7, 1.0, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, -0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    // _slideAnimation2 = Tween<Offset>(
    //   begin: const Offset(-1.0, 0.0),
    //   end: Offset.zero,
    // ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    // _slideAnimation3 = Tween<Offset>(
    //   begin: const Offset(1.0, 0.0),
    //   end: Offset.zero,
    // ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    _slideAnimation4 = Tween<Offset>(
      begin: const Offset(0.0, 2.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   _slideController.dispose();
  //   _fadeController.dispose();
  //   super.dispose();
  // }

  @override
  void dispose() {
    _controller.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    _slideController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  Widget buildOtpTextField(int index, double width) {
    return Container(
      height: width * 0.14,
      width: width * 0.14,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        cursorHeight: 25,
        decoration: InputDecoration(counterText: "", border: InputBorder.none),
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (index < 3) {
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            } else {
              FocusScope.of(context).unfocus();
            }
          } else if (index > 0) {
            FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return SlideTransition(
                  position: _slideAnimation,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 100),
                        width: MediaQuery.of(context).size.width,
                        child: CustomPaint(
                          painter: BgCurvePainter(_animation.value),
                        ),
                      ),
                      Positioned(
                        child: Image.asset(
                          'assets/mobile.png',
                          height: height * 0.5,
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.225,
                        left: MediaQuery.of(context).size.width / 2.35,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.shade300,
                                Colors.blue.shade100,
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.check_rounded,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SlideTransition(
              position: _slideAnimation,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Registration',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                children: [
                  Text(
                    'Enter the Code sent to',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '+123 456 789 0',
                    style: TextStyle(
                      color: Colors.blue.shade300,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            SlideTransition(
              position: _slideAnimation,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (index) => buildOtpTextField(index, width),
                  ),
                ),
              ),
            ),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                children: [
                  Text(
                    "I Didn't Receive the Code?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) =>
                        LinearGradient(
                          ////colors: [Color(0xff5932A9), Color(0xff3892D3)],
                          colors: [Colors.blue.shade300, Colors.blue.shade100],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                    child: Text(
                      'Resend Code',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SlideTransition(
              position: _slideAnimation4,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(1000)),
                  border: Border.all(color: Colors.blue.shade300),
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade300, Colors.blue.shade100],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Center(
                    child: Text(
                      'Verify',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
