import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_point/constants.dart';
import 'package:scan_point/screens/login_preference.dart';

class LoginMethod extends StatelessWidget {
  const LoginMethod({super.key});

  @override
  Widget build(BuildContext context) {
    
    // Device's screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final obj = Constants();
    String loginMethod = "";
    
    return ColorfulSafeArea(
      color: Colors.white,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/login_bg.jpg"
                  ),
                  fit: BoxFit.fill
                )
              )
            ),
            Center(
              child: Container(
                height: screenHeight * 0.5,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.1)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Please select an option to proceed",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.04,
                        color: obj.darkGray,
                        fontWeight: FontWeight.w500
                      )
                    ),
                    SizedBox(
                      height: screenHeight * 0.05
                    ),

                    // Quick login
                    ElevatedButton(
                      onPressed: () {
                        loginMethod = "quickLogin";
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => LoginPreference(loginMethod: loginMethod) // Navigate to login preference page
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: obj.navyBlue,
                        fixedSize: Size(screenWidth * 0.8, screenHeight * 0.1),
                        shape: const RoundedRectangleBorder()
                      ),
                      child: Text(
                        "Quick Login",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.04,
                          color: Colors.white,
                          letterSpacing: 1
                        )
                      )
                    ),
                    SizedBox(
                      height: screenHeight * 0.05
                    ),
                
                    // Attendance login
                    ElevatedButton(
                      onPressed: () {
                        loginMethod = "attendanceLogin";
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => LoginPreference(loginMethod: loginMethod) // Navigate to login preference page
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: obj.navyBlue,
                        fixedSize: Size(screenWidth * 0.8, screenHeight * 0.1),
                        shape: const RoundedRectangleBorder()
                      ),
                      child: Text(
                        "Attendance Login",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.04,
                          color: Colors.white,
                          letterSpacing: 1
                        )
                      )
                    )
                  ]
                )
              )
            )
          ]
        )
      )
    );
  }
}

