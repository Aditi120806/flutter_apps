import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BloodDonationInfoUI());
}

class BloodDonationInfoUI extends StatelessWidget {
  const BloodDonationInfoUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Donation Info',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      home: Scaffold(
        //backgroundColor: const Color.fromARGB(246, 205, 247, 247),
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text(
            'Blood Donation Info',
            style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold, fontSize: 22,color: Colors.white),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        body: const BloodDonationInfoBody(),
      ),
    );
  }
}

class BloodDonationInfoBody extends StatelessWidget {
  const BloodDonationInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              child: _buildShapedContainer(
                context,
                shape: BoxShape.rectangle,
                title: "Why Donate Blood?",
                description:
                    "Donating blood saves lives and supports countless medical treatments.",
                icon: Icons.favorite,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              child: _buildShapedContainer(
                context,
                shape: BoxShape.rectangle,
                title: "Components of Blood",
                description:
                    "Blood is made of red cells, white cells, platelets, and plasma.",
                icon: Icons.opacity,
                color: Colors.orangeAccent,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              child: _buildRoundedRectangle(
                title: "Who Benefits?",
                description:
                    "Accident victims, cancer patients, and newborns rely on donations.",
                icon: Icons.people,
                color: Colors.greenAccent,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              child: _buildShapedContainer(
                context,
                shape: BoxShape.rectangle,
                title: "Necessity of Blood",
                description:
                    "A person needs blood every 2 seconds. Your donation matters!",
                icon: Icons.bloodtype,
                color: Colors.purpleAccent,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              child: _buildRoundedRectangle(
                title: "Health Benefits",
                description:
                    "Donating blood can improve your cardiovascular health.",
                icon: Icons.health_and_safety,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShapedContainer(
    BuildContext context, {
    required BoxShape shape,
    required String title,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        shape: shape,
        borderRadius: shape == BoxShape.rectangle ? BorderRadius.circular(15) : null,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(icon, size: 30, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.ubuntu(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: GoogleFonts.quicksand(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoundedRectangle({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(icon, size: 30, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.ubuntu(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: GoogleFonts.quicksand(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
