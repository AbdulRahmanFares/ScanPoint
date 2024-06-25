import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:scan_point/constants.dart';
import 'package:scan_point/screens/custom_clipper.dart';
import 'package:scan_point/screens/login_preference.dart';
import 'package:scan_point/screens/password.dart';

class FetchMobileNumber extends StatefulWidget {
  final String loginMethod;

  const FetchMobileNumber({
    required this.loginMethod,
    super.key
  });

  @override
  State<FetchMobileNumber> createState() => _FetchMobileNumberState();
}

class _FetchMobileNumberState extends State<FetchMobileNumber> {

  final obj = Constants();
  TextEditingController mobileNumberController = TextEditingController();
  String mobileNumber = "";
  List<SimCard> simCard = <SimCard>[];
  String loginPreference = "";

  @override
  void initState() {
    super.initState();
    MobileNumber.listenPhonePermission((isPermissionGranted) => {
      if (isPermissionGranted) {
        initMobileNumberState()
      } else {}
    });
    initMobileNumberState();
  }

  // Platform messages are asynchronous, so we initialize in an async method
  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }

    // Platform messages may fail, so we use a try / catch PlatformException
    try {
      simCard = (await MobileNumber.getSimCards)!;
      if (simCard.isNotEmpty) {
        // Handle nullable type for number
        mobileNumber = simCard[0].number ?? "";
        mobileNumberController.text = mobileNumber; // Set the mobile number to the controller
      }
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of ${e.message}");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance

    if (!mounted) return;

    setState(() {});
  }

  String formatMobileNumber(String countryCode, String number) {
    return "$countryCode - $number";
  }

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
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => LoginPreference(loginMethod: widget.loginMethod) // Navigate to login preference page
                )),
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
                        "MOBILE NUMBER",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.08,
                          color: obj.darkGray,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2
                        )
                      ),
                      Text(
                        "Please confirm your mobile number for verification",
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

                      // Mobile number
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              bottom: screenWidth * 0.1
                            ),
                            height: screenHeight * 0.1,
                            width: screenWidth * 0.2,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: obj.darkGray
                              )
                            ),
                            child: Icon(
                              Icons.phone,
                              color: obj.darkGray,
                              size: screenWidth * 0.07
                            )
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              bottom: screenWidth * 0.1,
                              right: screenWidth * 0.05
                            ),
                            padding: EdgeInsets.only(
                              left: screenWidth * 0.1,
                              right: screenWidth * 0.1
                            ),
                            height: screenHeight * 0.1,
                            width: screenWidth * 0.65,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: obj.darkGray
                              )
                            ),
                            alignment: Alignment.center,
                            child: TextFormField(
                              controller: mobileNumberController,
                              maxLines: 1,
                              cursorColor: Colors.cyan,
                              keyboardType: TextInputType.phone,

                              // User input style
                              style: GoogleFonts.poppins(
                                fontSize: screenWidth * 0.05,
                                color: obj.darkGray,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 2
                              ),

                              decoration: const InputDecoration(
                                border: InputBorder.none // Remove the underline
                              )
                            )
                          )
                        ]
                      ),

                      // Verify button
                      ElevatedButton(
                        onPressed: () {
                          loginPreference = "mobileNumber";
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => Password(loginMethod: widget.loginMethod, loginPreference: loginPreference, id: mobileNumber) // Navigate to password page
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: obj.navyBlue,
                          fixedSize: Size(screenWidth * 0.9, screenHeight * 0.1),
                          shape: const RoundedRectangleBorder()
                        ),
                        child: Text(
                          "Verify Mobile Number",
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

