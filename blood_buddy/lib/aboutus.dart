import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us",
          style: GoogleFonts.ubuntu(fontSize: 25, fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.redAccent, Colors.red[700]!],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "Welcome to BloodBuddy!",
                  style: GoogleFonts.ubuntu(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Section Title
            Text(
              "Our Mission",
              style: GoogleFonts.ubuntu(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 10),

            // Mission Description
            Text(
              "BloodBuddy is dedicated to saving lives through blood donation. Our goal is to connect donors with those in need of blood, ensuring that no one ever has to face a shortage of life-saving resources.",
              style: GoogleFonts.quicksand(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),

            // Section Title
            Text(
              "Why Donate Blood?",
              style: GoogleFonts.ubuntu(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 10),

            // Blood Donation Importance
            Text(
              "Every blood donation can save up to 3 lives. Blood donations are critical for surgeries, cancer treatments, trauma victims, and people with chronic conditions. Your donation is a simple way to make a life-changing difference.",
              style: GoogleFonts.quicksand(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),

            // Section Title
            Text(
              "Our Impact",
              style: GoogleFonts.ubuntu(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 10),

            // Impact Description
            Text(
              "Since our inception, we have facilitated the donation of thousands of liters of blood, helping hospitals across the region save lives. Together, we are building a community where blood donation is easy, safe, and impactful.",
              style: GoogleFonts.quicksand(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30),

            // Call to Action: Join Us
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Join Us and Save Lives!",
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
