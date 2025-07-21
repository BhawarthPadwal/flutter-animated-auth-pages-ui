import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_animated_auth_ui/screens/login_screen.dart';
import 'package:flutter_custom_animated_auth_ui/screens/otp_screen.dart';
import 'package:flutter_custom_animated_auth_ui/shapes/logo_painter.dart';
import 'package:flutter_custom_animated_auth_ui/shapes/wave_clipper.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  late Animation _animation2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _animation = Tween<double>(
      begin: 0.0,
      end: 2 * math.pi,
    ).animate(_controller);
    _animation2 = Tween<double>(
      begin: 0.5,
      end: 2 * math.pi + 0.5,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final diameter = width * 0.08; // 8% of screen width
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //color: Colors.grey,
              Stack(
                children: [
                  AnimatedBuilder(
                    animation: _animation2,
                    builder: (context, child) {
                      return ClipPath(
                        clipper: WaveClipper(_animation2.value),
                        child: Container(
                          width: width,
                          height: height * 0.37,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.shade100,
                                Colors.blue.shade300,
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return ClipPath(
                        clipper: WaveClipper(_animation.value),
                        child: Container(
                          width: width,
                          height: height * 0.35,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.shade300,
                                Colors.blue.shade100,
                              ],
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 60),
                                width: 100,
                                height: 100,
                                //color: Colors.grey,
                                child: CustomPaint(painter: LogoPainter()),
                              ),
                              Text(
                                'MOFINOW',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70, bottom: 20),
                child: Text(
                  'Welcome !',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => OtpScreen()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
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
                        'Create Account',
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
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (_) => LoginScreen()),
              //     );
              //   },
              //   child: Container(
              //     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(1000)),
              //       color: Colors.white,
              //       border: Border.all(color: Colors.blue.shade300, width: 1.5),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(vertical: 15),
              //       child: Center(
              //         child: ShaderMask(
              //           shaderCallback: (bounds) =>
              //               LinearGradient(
              //                 ////colors: [Color(0xff5932A9), Color(0xff3892D3)],
              //                 colors: [
              //                   Colors.blue.shade300,
              //                   Colors.blue.shade100,
              //                 ],
              //                 begin: Alignment.topLeft,
              //                 end: Alignment.bottomRight,
              //               ).createShader(
              //                 Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              //               ),
              //           child: Text(
              //             'Login',
              //             style: TextStyle(
              //               fontSize: 18,
              //               fontWeight: FontWeight.w600,
              //               color: Colors
              //                   .white, // Must be white to see the gradient
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade300, Colors.blue.shade100],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  padding: EdgeInsets.all(2), // Border thickness
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                        child: ShaderMask(
                          shaderCallback: (bounds) =>
                              LinearGradient(
                                colors: [
                                  Colors.blue.shade300,
                                  Colors.blue.shade100,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(
                                Rect.fromLTWH(
                                  0,
                                  0,
                                  bounds.width,
                                  bounds.height,
                                ),
                              ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color:
                                  Colors.white, // must be white for ShaderMask
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Container(
                      width: diameter,
                      height: diameter,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade300,
                            Colors.blue.shade100,
                          ], // your gradient colors
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('assets/twitter.png'),
                      ),
                    ),
                    Container(
                      width: diameter,
                      height: diameter,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade300,
                            Colors.blue.shade100,
                          ], // your gradient colors
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('assets/linkedin.png'),
                      ),
                    ),
                    Container(
                      width: diameter,
                      height: diameter,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade300,
                            Colors.blue.shade100,
                          ], // your gradient colors
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('assets/facebook.png'),
                      ),
                    ),
                    Container(
                      width: diameter,
                      height: diameter,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade300,
                            Colors.blue.shade100,
                          ], // your gradient colors
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset('assets/google.png'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Sign in with another account!',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
