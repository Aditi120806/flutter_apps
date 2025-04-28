import 'package:blood_buddy/aboutus.dart';
import 'package:blood_buddy/findDonor.dart';
import 'package:blood_buddy/bloodhealthmonitor.dart';
import 'package:blood_buddy/receiverprofile.dart';
import 'package:blood_buddy/bloodrequest.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:blood_buddy/campaigns.dart';

void main() {
  runApp(const Myhomepage());
}

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});
  @override
  State createState() => _Home();
}

class _Home extends State<Myhomepage> {
  int menuIndex = 0;
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Stack(
        children: [
          // Curved AppBar Background
          Container(
            height: 190, // Adjust the height to control the AppBar's coverage
            decoration: const BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
            child: Align(
    alignment: Alignment.topCenter,  // Aligns the title to the top
    child: Padding(
      padding: const EdgeInsets.only(top: 50), // Adjust the top padding to move the title up or down
      child: Text(
        "BloodBuddy",
        style: GoogleFonts.poppins(
          fontSize: 27,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    ),
  ),
          ),

          // Contents Above the AppBar
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 90), // Push contents below the curved AppBar
                    Center(
                      child: Container(
                        height: 260,
                        width: 360,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 3,
                              blurRadius: 8,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                Text(
                                  "WELCOME",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                Text(
                                  user?.displayName ?? 'User',
                                  style: GoogleFonts.poppins(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 160,
                              width: MediaQuery.of(context).size.width - 30,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Image.asset(
                                "assets/images6.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Container(
                        height: 260,
                        width: 360,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    child: FeatureButton(
                                      icon: Icons.campaign,
                                      label: "CAMPAIGNS",
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => const Campaign(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const Spacer(),
                                  FeatureButton(
                                    icon: Icons.volunteer_activism_rounded,
                                    label: "REQUESTS",
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (e) => SwipeableSections(),
                                        ),
                                      );
                                    },
                                  ),
                                  const Spacer(),
                                  FeatureButton(
                                    icon: Icons.person_search_rounded,
                                    label: "FIND DONOR",
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => const FindDonor(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(width: 8),
                                SizedBox(
                                  //width: MediaQuery.of(context).size.width / 2 - 30,
                                  child: FeatureButton(
                                    icon: Icons.groups,
                                    label: "About Us",
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => const AboutUsPage(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                //const SizedBox(width: 10),
                                SizedBox(
                                  //width: MediaQuery.of(context).size.width / 2 - 30,
                                  child: FeatureButton(
                                    icon: Icons.diversity_1,
                                    label: "Health checkup",
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BloodHealthMonitoringPage(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Container(
                        width: 360,
                        height: 170,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 3,
                              blurRadius: 8,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Donation requests",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 100,
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('requests')
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                    if (!snapshot.hasData ||
                                        snapshot.data!.docs.isEmpty) {
                                      return const Center(
                                          child: Text('No donors found.'));
                                    }
                                    final requestDocs = snapshot.data!.docs;
                                    return ListView.builder(
                                      itemCount: requestDocs.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        var request = requestDocs[index];
                                        String name = request['name'];
                                        String bloodgroup = request['bloodgroup'];
                                        String city = request['city'];
                                        String mobileNumber =
                                            request['mobile'].toString();
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(builder: (context) {
                                              return receiverProfile(
                                                name: name,
                                                bloodgroup: bloodgroup,
                                                city: city,
                                                mobileNumber: mobileNumber,
                                              );
                                            }));
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(right: 10),
                                            height: 70,
                                            width: 230,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: const Color.fromARGB(
                                                  246, 205, 247, 247),
                                            ),
                                            child: Column(
                                              children: [
                                                const SizedBox(height: 10),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 8.0),
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.person_2_rounded,
                                                        color: Colors.redAccent,
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(
                                                        name,
                                                        style: GoogleFonts.poppins(
                                                            color: Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 8.0),
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.place,
                                                        color: Colors.redAccent,
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(
                                                        city,
                                                        style: GoogleFonts.poppins(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 8.0),
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.bloodtype,
                                                        color: Colors.redAccent,
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(
                                                        bloodgroup,
                                                        style: GoogleFonts.poppins(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onTap;

  const FeatureButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          Container(
            height: 90,
            width: 105,
            decoration: BoxDecoration(
            color:  const Color.fromARGB(
                                                246, 205, 247, 247),
            borderRadius: BorderRadius.circular(40)),
            child: Icon(icon, size: 40, color: Colors.redAccent),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
