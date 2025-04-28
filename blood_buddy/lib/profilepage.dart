import 'package:blood_buddy/editprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Profilepage());
}

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _Profilepage();
}

class _Profilepage extends State<Profilepage> {
  String name = '';
  String email = '';
  String city = '';
  String bloodGroup = '';
  var mobile;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Reference to the Firestore 'users' collection
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('donors')
          .doc(user.uid) // Using user UID to get the correct document
          .get();

      if (docSnapshot.exists) {
        var userData = docSnapshot.data() as Map<String, dynamic>;
        // Update class-level variables
        setState(() {
          name = userData['name'] ?? 'No name';
          email = userData['email'] ?? 'No email';
          city = userData['city'] ?? 'No city';
          bloodGroup = userData['bloodGroup'] ?? 'No blood group';
         mobile = userData['mobile'] is int? userData['mobile'].toString()
            : (userData['mobile'] is String
                ? userData['mobile']!.replaceAll(RegExp(r'\D'), ' ')
                : 'No mobile');
        });
      } else {
        print('No data found');
      }
    } else {
      print('No user is logged in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(246, 205, 247, 247),
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFff4b5c), Colors.orangeAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                height: 220,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Your Profile",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 140,
                child: CircleAvatar(
                  radius: 85,
                  backgroundImage: AssetImage("assets/d3.jpg"),
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 90),
          Column(
            children: [
              Text(
                name,
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You are a life saviour",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Divider(thickness: 2, color: Colors.grey[300]),
              const SizedBox(height: 10),

              // User Details
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.water_drop, color: Colors.redAccent),
                      title: Text(
                        bloodGroup,
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.phone, color: Colors.green),
                      title: Text(
                        "$mobile",
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.location_on, color: Colors.blue),
                      title: Text(
                        city,
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Divider(thickness: 2, color: Colors.grey[300]),

              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                         Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return  EditProfilePage();
                    }));
                        print("Edit Profile");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFff4b5c),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      ),
                      child: Text(
                        "Edit Profile",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        print("Log Out");
                        Navigator.pop(context); // To go back to the login screen
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFff4b5c),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      ),
                      child: Text(
                        "Log Out",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
