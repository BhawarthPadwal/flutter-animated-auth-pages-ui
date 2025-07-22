// import 'dart:math' as math;

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_custom_animated_auth_ui/screens/login_screen.dart';
// import 'package:flutter_custom_animated_auth_ui/screens/otp_screen.dart';
// import 'package:flutter_custom_animated_auth_ui/shapes/logo_painter.dart';
// import 'package:flutter_custom_animated_auth_ui/shapes/wave_clipper.dart';

// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({super.key});

//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late AnimationController _slide_controller;
//   late AnimationController _fade_controller;
//   late Animation _animation;
//   late Animation _animation2;
//   late Animation<double> _animation3;
//   late Animation<Offset> _slide_animation;
//   late Animation<Offset> _slide_animation2;
//   late Animation<Offset> _slide_animation3;
//   late Animation<Offset> _slide_animation4;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..repeat();
//     _slide_controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3),
//     )..forward();
//     _fade_controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3),
//     )..forward();

//     _animation = Tween<double>(
//       begin: 0.0,
//       end: 2 * math.pi,
//     ).animate(_controller);
//     _animation2 = Tween<double>(
//       begin: 0.5,
//       end: 2 * math.pi + 0.5,
//     ).animate(_controller);
//     _animation3 = CurvedAnimation(
//       parent: _fade_controller,
//       curve: Interval(0.7, 1.0, curve: Curves.easeIn),
//     );

//     _slide_animation =
//         Tween<Offset>(
//           begin: Offset(0.0, -0.2), // from bottom
//           end: Offset.zero,
//         ).animate(
//           CurvedAnimation(parent: _slide_controller, curve: Curves.easeOut),
//         );

//     _slide_animation2 =
//         Tween<Offset>(
//           begin: Offset(-1.0, 0.0), // from bottom
//           end: Offset.zero,
//         ).animate(
//           CurvedAnimation(parent: _slide_controller, curve: Curves.easeOut),
//         );

//     _slide_animation3 =
//         Tween<Offset>(
//           begin: Offset(1.0, 0.0), // from bottom
//           end: Offset.zero,
//         ).animate(
//           CurvedAnimation(parent: _slide_controller, curve: Curves.easeOut),
//         );
//     _slide_animation4 =
//         Tween<Offset>(
//           begin: Offset(0.0, 2.0), // from bottom
//           end: Offset.zero,
//         ).animate(
//           CurvedAnimation(parent: _slide_controller, curve: Curves.easeOut),
//         );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     final diameter = width * 0.08; // 8% of screen width
//     return AnnotatedRegion(
//       value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               //color: Colors.grey,
//               SlideTransition(
//                 position: _slide_animation,
//                 child: Stack(
//                   children: [
//                     AnimatedBuilder(
//                       animation: _animation2,
//                       builder: (context, child) {
//                         return ClipPath(
//                           clipper: WaveClipper(_animation2.value),
//                           child: Container(
//                             width: width,
//                             height: height * 0.37,
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: [
//                                   Colors.blue.shade100,
//                                   Colors.blue.shade300,
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                     AnimatedBuilder(
//                       animation: _animation,
//                       builder: (context, child) {
//                         return ClipPath(
//                           clipper: WaveClipper(_animation.value),
//                           child: Container(
//                             width: width,
//                             height: height * 0.35,
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: [
//                                   Colors.blue.shade300,
//                                   Colors.blue.shade100,
//                                 ],
//                               ),
//                             ),
//                             child: Column(
//                               children: [
//                                 Container(
//                                   margin: EdgeInsets.only(top: 60),
//                                   width: 100,
//                                   height: 100,
//                                   //color: Colors.grey,
//                                   child: CustomPaint(painter: LogoPainter()),
//                                 ),
//                                 Text(
//                                   'MOFINOW',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               SlideTransition(
//                 position: _slide_animation,
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 70, bottom: 20),
//                   child: Text(
//                     'WELCOME !',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.blue.shade300,
//                     ),
//                   ),
//                 ),
//               ),
//               SlideTransition(
//                 position: _slide_animation2,
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (_) => OtpScreen()),
//                     );
//                   },
//                   child: Container(
//                     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(1000)),
//                       border: Border.all(color: Colors.blue.shade300),
//                       gradient: LinearGradient(
//                         colors: [Colors.blue.shade300, Colors.blue.shade100],
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 15),
//                       child: Center(
//                         child: Text(
//                           'Create Account',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SlideTransition(
//                 position: _slide_animation3,
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (_) => LoginScreen()),
//                     );
//                   },
//                   child: Container(
//                     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [Colors.blue.shade300, Colors.blue.shade100],
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                       ),
//                       borderRadius: BorderRadius.circular(1000),
//                     ),
//                     padding: EdgeInsets.all(2), // Border thickness
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(1000),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         child: Center(
//                           child: ShaderMask(
//                             shaderCallback: (bounds) =>
//                                 LinearGradient(
//                                   colors: [
//                                     Colors.blue.shade300,
//                                     Colors.blue.shade100,
//                                   ],
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight,
//                                 ).createShader(
//                                   Rect.fromLTWH(
//                                     0,
//                                     0,
//                                     bounds.width,
//                                     bounds.height,
//                                   ),
//                                 ),
//                             child: Text(
//                               'Login',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors
//                                     .white, // must be white for ShaderMask
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               SlideTransition(
//                 position: _slide_animation4,
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 50),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     spacing: 10,
//                     children: [
//                       Container(
//                         width: diameter,
//                         height: diameter,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           gradient: LinearGradient(
//                             colors: [
//                               Colors.blue.shade300,
//                               Colors.blue.shade100,
//                             ], // your gradient colors
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8),
//                           child: Image.asset('assets/twitter.png'),
//                         ),
//                       ),
//                       Container(
//                         width: diameter,
//                         height: diameter,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           gradient: LinearGradient(
//                             colors: [
//                               Colors.blue.shade300,
//                               Colors.blue.shade100,
//                             ], // your gradient colors
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8),
//                           child: Image.asset('assets/linkedin.png'),
//                         ),
//                       ),
//                       Container(
//                         width: diameter,
//                         height: diameter,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           gradient: LinearGradient(
//                             colors: [
//                               Colors.blue.shade300,
//                               Colors.blue.shade100,
//                             ], // your gradient colors
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8),
//                           child: Image.asset('assets/facebook.png'),
//                         ),
//                       ),
//                       Container(
//                         width: diameter,
//                         height: diameter,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           gradient: LinearGradient(
//                             colors: [
//                               Colors.blue.shade300,
//                               Colors.blue.shade100,
//                             ], // your gradient colors
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8),
//                           child: Image.asset('assets/google.png'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               FadeTransition(
//                 opacity: _animation3,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   child: Text(
//                     'Sign in with another account!',
//                     style: TextStyle(fontSize: 12, color: Colors.black),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
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

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _slideController;
  late AnimationController _fadeController;

  late Animation<double> _animation;
  late Animation<double> _animation2;
  late Animation<double> _fadeAnimation;

  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _slideAnimation2;
  late Animation<Offset> _slideAnimation3;
  late Animation<Offset> _slideAnimation4;

  @override
  void initState() {
    super.initState();

    // Wave animation controller (looping)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

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

    // Two wave animations with different phase shifts
    _animation = Tween<double>(begin: 0.0, end: 2 * math.pi).animate(_controller);
    _animation2 = Tween<double>(begin: 0.5, end: 2 * math.pi + 0.5).animate(_controller);

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Interval(0.7, 1.0, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, -0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    _slideAnimation2 = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    _slideAnimation3 = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    _slideAnimation4 = Tween<Offset>(
      begin: const Offset(0.0, 2.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    _slideController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final diameter = size.width * 0.08;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top animated waves and logo
              SlideTransition(
                position: _slideAnimation,
                child: Stack(
                  children: [
                    AnimatedBuilder(
                      animation: _animation2,
                      builder: (_, __) {
                        return ClipPath(
                          clipper: WaveClipper(_animation2.value),
                          child: Container(
                            width: size.width,
                            height: size.height * 0.37,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blue.shade100, Colors.blue.shade300],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (_, __) {
                        return ClipPath(
                          clipper: WaveClipper(_animation.value),
                          child: Container(
                            width: size.width,
                            height: size.height * 0.35,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blue.shade300, Colors.blue.shade100],
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 60),
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: CustomPaint(painter: LogoPainter()),
                                ),
                                const SizedBox(height: 10),
                                const Text(
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
              ),

              // Welcome Text
              SlideTransition(
                position: _slideAnimation,
                child: Padding(
                  padding: const EdgeInsets.only(top: 70, bottom: 20),
                  child: Text(
                    'WELCOME !',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue.shade300,
                    ),
                  ),
                ),
              ),

              // Create Account Button
              SlideTransition(
                position: _slideAnimation2,
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OtpScreen())),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      border: Border.all(color: Colors.blue.shade300),
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade300, Colors.blue.shade100],
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: const Center(
                      child: Text(
                        'Create Account',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),

              // Login Button with Gradient Text
              SlideTransition(
                position: _slideAnimation3,
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade300, Colors.blue.shade100],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    padding: const EdgeInsets.all(2), // Gradient border
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                        child: ShaderMask(
                          shaderCallback: (bounds) => LinearGradient(
                            colors: [Colors.blue.shade300, Colors.blue.shade100],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Social Buttons
              SlideTransition(
                position: _slideAnimation4,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    children: [
                      _buildSocialIcon('assets/twitter.png', diameter),
                      _buildSocialIcon('assets/linkedin.png', diameter),
                      _buildSocialIcon('assets/facebook.png', diameter),
                      _buildSocialIcon('assets/google.png', diameter),
                    ],
                  ),
                ),
              ),

              // Bottom Fade-in Text
              FadeTransition(
                opacity: _fadeAnimation,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Sign in with another account!',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String assetPath, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Colors.blue.shade300, Colors.blue.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Image.asset(assetPath),
    );
  }
}
