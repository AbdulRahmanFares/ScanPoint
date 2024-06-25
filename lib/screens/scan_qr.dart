import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_point/constants.dart';
import 'package:scan_point/screens/allow_location.dart';
import 'package:scan_point/screens/custom_clipper.dart';
import 'package:scan_point/screens/login_method.dart';

class ScanQR extends StatefulWidget {
  final String id;

  const ScanQR({
    required this.id,
    super.key
  });

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {

  final obj = Constants();

  // Platform messages are asynchronous, so we initialize in an async method
  Future<void> scanQR() async {
    String qrScanResult = ""; // Initialize with an empty string

    // Platform messages may fail, so we use a try / catch PlatformException
    try {
      qrScanResult = await FlutterBarcodeScanner.scanBarcode(
        "#1A237E", // Line color
        "CANCEL", // Cancel button text
        true, // Show flash icon
        ScanMode.QR // Scan mode
      );
      debugPrint("QR scan result: $qrScanResult");
    } on PlatformException catch (e) {
      debugPrint("Failed to scan qr because of ${e.message}");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance

    if (!mounted) return;

    // Navigate to Home page if QR scan result is not empty and not cancelled
    if (qrScanResult != '-1' && qrScanResult.isNotEmpty) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => AllowLocation(id: widget.id) // Navigate to allow location page
      ));
    }

    setState(() {});
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
                        "SCAN QR",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.08,
                          color: obj.darkGray,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2
                        )
                      ),
                      Text(
                        "Please scan the qr to proceed",
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

                      // Scan button
                      ElevatedButton(
                        onPressed: () => scanQR(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: obj.navyBlue,
                          fixedSize: Size(screenWidth * 0.9, screenHeight * 0.1),
                          shape: const RoundedRectangleBorder()
                        ),
                        child: Text(
                          "Scan",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.04,
                            color: Colors.white,
                            letterSpacing: 1
                          )
                        )
                      ),
                      SizedBox(
                        height: screenWidth * 0.1
                      ),

                      // Come back later button
                      ElevatedButton(
                        onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => const LoginMethod() // Navigate to login page
                        )),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: obj.navyBlue,
                          fixedSize: Size(screenWidth * 0.9, screenHeight * 0.1),
                          shape: const RoundedRectangleBorder()
                        ),
                        child: Text(
                          "Come Back Later",
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

