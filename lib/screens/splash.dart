import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_point/constants.dart';
import 'package:scan_point/screens/login_method.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  final obj = Constants();
  bool alreadyLoggedIn = false;

  @override
  void initState() {
    super.initState();
    alreadyLoggedIn ? navigateToHomePage() : navigateToLoginMethodPage();
  }

  // Navigate to login method page
  navigateToLoginMethodPage() async {
    await Future.delayed(const Duration(seconds: 2));

    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => const LoginMethod() // Navigate to login method page
    ));
  }

  // Navigate to home page
  navigateToHomePage() async {
    await Future.delayed(const Duration(seconds: 2));

    // Navigator.pushReplacement(context, MaterialPageRoute(
    //   builder: (context) => const Home() // Navigate to home page
    // ));
  }

  @override
  Widget build(BuildContext context) {

    // Device's screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "SCAN",
              style: GoogleFonts.poppins(
                fontSize: screenHeight * 0.06,
                color: obj.darkGray,
                fontWeight: FontWeight.bold,
                letterSpacing: 1
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "P",
                  style: GoogleFonts.poppins(
                    fontSize: screenHeight * 0.06,
                    color: obj.navyBlue,
                    fontWeight: FontWeight.bold
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.02,
                    right: screenWidth * 0.02
                  ),
                  child: Image.asset(
                    "assets/images/focus.png",
                    height: screenWidth * 0.09,
                    color: obj.darkGray
                  )
                ),
                Text(
                  "INT",
                  style: GoogleFonts.poppins(
                    fontSize: screenHeight * 0.06,
                    color: obj.navyBlue,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1
                  )
                )
              ]
            )
          ]
        )
      )
    );
  }
}

