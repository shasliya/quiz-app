import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class aboutquiz extends StatefulWidget {
  const aboutquiz({super.key});

  @override
  State<aboutquiz> createState() => _aboutquizState();
}

class _aboutquizState extends State<aboutquiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text('About', style: GoogleFonts.expletusSans(fontSize: 14),),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "asset/images/Screenshot 2024-11-19 125027 (1).png",
                width: 200,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                  child: Text('Description', style: GoogleFonts.expletusSans(fontSize: 16))),
            ),
            Container(
              height: 1000,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), // Curved corners
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " Aqwiz is a fun quiz app with three levels of difficulty—Easy, Medium and Hard. Each level has more than 200 questions on different topics. Whether you're just starting out or you're an expert, this app has something for everyone!",
                      style: GoogleFonts.expletusSans(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " Levels:",
                      style: GoogleFonts.expletusSans(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " Easy\nMedium\nHard",
                      style: GoogleFonts.expletusSans(fontSize: 18,),
                    ),
                  ),

                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Version: 1.1.1",
                      style: GoogleFonts.expletusSans(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Features:",
                      style: GoogleFonts.expletusSans(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "200+ Questions per Level\n"
                          "Score Page\n"
                          "Instant Feedback\n"
                          "Easy to Use\n"
                          "Learn & Have Fun",
                      style: GoogleFonts.expletusSans(fontSize: 18,
                    ),
                  ),),
                  // BulletList(["Track tasks", "Set reminders", "Generate reports"]),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Developer: quiz Technologies",
                      style: GoogleFonts.expletusSans(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Contact: support@aqwiz.com",
                      style: GoogleFonts.expletusSans(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Uncomment below code to enable Privacy Policy and Terms links
                  // GestureDetector(
                  //   onTap: () {
                  //     // Open Privacy Policy URL
                  //     launch('https://www.appname.com/privacy');
                  //   },
                  //   child: Text('Privacy Policy'),
                  // ),
                  // SizedBox(height: 10),
                  // GestureDetector(
                  //   onTap: () {
                  //     // Open Terms of Service URL
                  //     launch('https://www.appname.com/terms');
                  //   },
                  //   child: Text('Terms of Service'),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
