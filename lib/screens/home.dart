import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_point/constants.dart';
import 'package:scan_point/screens/custom_clipper.dart';

class Home extends StatefulWidget {
  final String id;

  const Home({
    required this.id,
    super.key
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final obj = Constants();

  @override
  Widget build(BuildContext context) {

    // Device's screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ColorfulSafeArea(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SizedBox(
              height: screenHeight,
              width: screenWidth
            ),
            Container(
              height: screenHeight * 0.2,
              width: screenWidth,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/home_bg.jpg"
                  ),
                  fit: BoxFit.cover
                )
              )
            ),
            Positioned(
              top: screenHeight * 0.1,
              left: screenWidth * 0.3,
              child: CircleAvatar(
                radius: screenWidth * 0.2,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: screenWidth * 0.19,
                  backgroundImage: const AssetImage(
                    "assets/images/user.png"
                  )
                )
              )
            ),
            Positioned(
              bottom: screenHeight * 0.55,
              child: Container(
                height: screenHeight * 0.1,
                width: screenWidth,
                alignment: Alignment.center,
                child: Text(
                  "Amelia Rose",
                  style: GoogleFonts.poppins(
                    fontSize: screenHeight * 0.045,
                    color: obj.darkGray,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1
                  )
                )
              )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: HomeTileClipper(),
                child: Container(
                  height: screenHeight * 0.5,
                  width: screenWidth,
                  color: obj.lightGray,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          // Leave
                          Container(
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(screenWidth * 0.05)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: screenHeight * 0.07,
                                  width: screenHeight * 0.07,
                                  decoration: BoxDecoration(
                                    color: obj.lightGray,
                                    borderRadius: BorderRadius.circular(screenWidth)
                                  ),
                                  child: Icon(
                                    Icons.event_busy_sharp,
                                    size: screenHeight * 0.04,
                                    color: obj.navyBlue
                                  )
                                ),
                                Text(
                                  "Leave",
                                  style: GoogleFonts.poppins(
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.w500,
                                    color: obj.darkGray,
                                    letterSpacing: 1
                                  )
                                )
                              ]
                            )
                          ),

                          // Attendance
                          Container(
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(screenWidth * 0.05)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: screenHeight * 0.07,
                                  width: screenHeight * 0.07,
                                  decoration: BoxDecoration(
                                    color: obj.lightGray,
                                    borderRadius: BorderRadius.circular(screenWidth)
                                  ),
                                  child: Icon(
                                    Icons.event_available_sharp,
                                    size: screenHeight * 0.04,
                                    color: obj.navyBlue
                                  )
                                ),
                                Text(
                                  "Attendance",
                                  style: GoogleFonts.poppins(
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.w500,
                                    color: obj.darkGray,
                                    letterSpacing: 1
                                  )
                                )
                              ]
                            )
                          )
                        ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          // Report
                          Container(
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(screenWidth * 0.05)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: screenHeight * 0.07,
                                  width: screenHeight * 0.07,
                                  decoration: BoxDecoration(
                                    color: obj.lightGray,
                                    borderRadius: BorderRadius.circular(screenWidth)
                                  ),
                                  child: Icon(
                                    Icons.insert_chart_outlined_sharp,
                                    size: screenHeight * 0.04,
                                    color: obj.navyBlue
                                  )
                                ),
                                Text(
                                  "Report",
                                  style: GoogleFonts.poppins(
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.w500,
                                    color: obj.darkGray,
                                    letterSpacing: 1
                                  )
                                )
                              ]
                            )
                          ),

                          // Task
                          Container(
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(screenWidth * 0.05)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: screenHeight * 0.07,
                                  width: screenHeight * 0.07,
                                  decoration: BoxDecoration(
                                    color: obj.lightGray,
                                    borderRadius: BorderRadius.circular(screenWidth)
                                  ),
                                  child: Icon(
                                    Icons.task_outlined,
                                    size: screenHeight * 0.04,
                                    color: obj.navyBlue
                                  )
                                ),
                                Text(
                                  "Task",
                                  style: GoogleFonts.poppins(
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.w500,
                                    color: obj.darkGray,
                                    letterSpacing: 1
                                  )
                                )
                              ]
                            )
                          )
                        ]
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

