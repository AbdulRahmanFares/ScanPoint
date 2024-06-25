import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_point/constants.dart';
import 'package:scan_point/screens/custom_clipper.dart';
import 'package:scan_point/screens/employee_id.dart';
import 'package:scan_point/screens/fetch_mobile_number.dart';
import 'package:scan_point/screens/home.dart';
import 'package:scan_point/screens/scan_qr.dart';

class Password extends StatefulWidget {
  final String loginMethod;
  final String loginPreference;
  final String id;

  const Password({
    required this.loginMethod,
    required this.loginPreference,
    required this.id,
    super.key
  });

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {

  final obj = Constants();
  TextEditingController passwordController = TextEditingController();
  String password = "";
  bool obscureText = true; // Hide password

  @override
  Widget build(BuildContext context) {
    
    // Device's screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ColorfulSafeArea(
      color: obj.darkGray,
      child: Scaffold(
        backgroundColor: obj.darkGray,
        body: Stack(
          children: [
            Container(
              color: obj.darkGray
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  if (widget.loginPreference == "mobileNumber") {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => FetchMobileNumber(loginMethod: widget.loginMethod) // Navigate to fetch mobile number page
                    ));
                  } else {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => EmployeeId(loginMethod: widget.loginMethod) // Navigate to employee id page
                    ));
                  }
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: screenWidth * 0.07
                )
              )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: LoginProcessTileClipper(),
                child: Container(
                  padding: EdgeInsets.only(
                    top: screenWidth * 0.1,
                    left: screenWidth * 0.05
                  ),
                  height: screenHeight * 0.7,
                  width: screenWidth,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // First vertical line
                      Container(
                        margin: EdgeInsets.only(
                          bottom: screenWidth * 0.05
                        ),
                        height: screenHeight * 0.07,
                        width: screenWidth * 0.01,
                        color: obj.darkGray
                      ),
                      Text(
                        "PASSWORD",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.08,
                          color: obj.darkGray,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2
                        )
                      ),
                      Text(
                        "Please enter your password",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.04,
                          color: obj.darkGray,
                          fontWeight: FontWeight.w500
                        )
                      ),

                      // Second vertical line
                      Container(
                        margin: EdgeInsets.only(
                          top: screenWidth * 0.05,
                          bottom: screenWidth * 0.1
                        ),
                        height: screenHeight * 0.07,
                        width: screenWidth * 0.01,
                        color: obj.darkGray
                      ),

                      // Password
                      Container(
                        margin: EdgeInsets.only(
                          bottom: screenWidth * 0.1,
                          right: screenWidth * 0.05
                        ),
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.1,
                          right: screenWidth * 0.05
                        ),
                        height: screenHeight * 0.1,
                        width: screenWidth * 0.9,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: obj.darkGray
                          )
                        ),
                        alignment: Alignment.center,
                        child: TextFormField(
                          controller: passwordController,
                          maxLines: 1,
                          cursorColor: Colors.cyan,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: obscureText,

                          // User input style
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.05,
                            color: obj.darkGray,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2
                          ),

                          decoration: InputDecoration(
                            border: InputBorder.none, // Remove the underline
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              icon: Icon(
                                obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility
                              ),
                              color: Colors.grey,
                              iconSize: screenWidth * 0.07
                            )
                          )
                        )
                      ),

                      // Verify button
                      ElevatedButton(
                        onPressed: () {
                          if (widget.loginMethod == "quickLogin") {
                            Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => Home(id: widget.id) // Navigate to home page
                            ));
                          } else {
                            Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => ScanQR(id: widget.id) // Navigate to scan qr page
                            ));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: obj.navyBlue,
                          fixedSize: Size(screenWidth * 0.9, screenHeight * 0.1),
                          shape: const RoundedRectangleBorder()
                        ),
                        child: Text(
                          "Verify Password",
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
            )
          ]
        )
      )
    );
  }
}

