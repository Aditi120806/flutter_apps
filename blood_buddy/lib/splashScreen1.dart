import 'package:blood_buddy/welcome.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_fonts/google_fonts.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState() {
    super.initState();
    // Navigate to the Home screen after 3 seconds
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Welcome()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Customize background color
      body: Column(
        children: [
          Stack(children: [
            Container(
              height: 500,
              decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(150))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  width: 300,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.all(Radius.circular(210))),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    "assets/blood.jpg",
                  ),
                ),
              ],
            ),
          ]),
          const SizedBox(
            height: 50,
          ),
          Text(
            "EXCUSES NEVER SAVE A LIFE,",
            style: GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 8,
          ),
          Text("BLOOD DONATION DOES",
              style:  GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.w500)),
          const SizedBox(
            height: 20,
          ),
          Text(
            "BLOOD DONATION IS A",
            style:  GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 8,
          ),
          Text("GREATE ACT OF KINDNESS",
              style:  GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.w500)),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Next",
            style:  GoogleFonts.quicksand(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Welcome()),
              );
            },
            child: Text(
              "Skip to home",
              style: GoogleFonts.quicksand(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Home")),
//       body: Center(
//         child: Text(
//           "This is the Home Screen",
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }