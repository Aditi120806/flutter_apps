import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'customsnackbar.dart';

class DonarProfile extends StatefulWidget {
  final String? mobileNumber;
  final String? name;
  final String? bloodGroup;
  final String? city;
  final String? age;
  final String? gender;

  const DonarProfile({
    super.key,
    this.mobileNumber,
    this.name,
    this.bloodGroup,
    this.city,
    this.age,
    this .gender,
  });
   

  @override
  State<DonarProfile> createState() => _DonarProfileState();
}

class _DonarProfileState extends State<DonarProfile> {
  Future<void> requestBlood() async {
    // Get the current user from Firebase Authentication
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
         DocumentSnapshot<Map<String, dynamic>> userDoc = await FirebaseFirestore.instance
          .collection('donors')
          .doc(user.uid)
          .get();

      // Extract current user's mobile number and city
      int? mobile = userDoc.data()?['mobile'] ?? 'N/A';
      String? city = userDoc.data()?['city'] ?? 'N/A';
      String? bloodgroup = userDoc.data()?['bloodGroup'] ?? 'N/A';
      int? age = userDoc.data()?['age'];
      String? gender = userDoc.data()?['gender'] ?? 'N/A';
        // Add current user's data to Firestore 'requests' collection
        await FirebaseFirestore.instance.collection('requests').add({
          'userId': user.uid,  // User's unique ID
          'name': user.displayName ?? 'Anonymous', 
           'mobile': mobile ?? 'N/A', // User's mobile number
        'bloodgroup': bloodgroup ?? 'N/A', // User's blood group
        //  // User's name (if available)
          // 'email': user.email ?? 'No email', 
          'age':age ?? 0,
          'gender':gender ?? 'no age',
          'city':city ?? 'no city',
           //'mobile': user.mobile ?? 'No email', 
           // User's email (if available)
          'timestamp': FieldValue.serverTimestamp(),  // Timestamp of the request
        });

        // Use setState to show success message after request
        Customsnackbar.showcustomsnackbar( message: "Blood request added successfully!",context: context,);
      } catch (e) {
        // Use your custom ShowCustomSnackBar class to show error message
        Customsnackbar.showcustomsnackbar( message: "failed $e",context: context,);
      }
    } else {
      // If no user is logged in, show the message using custom SnackBar
  Customsnackbar.showcustomsnackbar( message: "no user logged in",context: context,);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(246, 205, 247, 247),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        toolbarHeight: 60,
        title: Text(
          "Donor Profile",
          style: GoogleFonts.ubuntu(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              height: 150,
              width: 150,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(136, 0, 0, 0),
                    offset: Offset(1, 7),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "assets/blood1.png",
                  fit: BoxFit.cover,
                  height: 130,
                  width: 130,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              widget.name ?? "N/A",
              style: GoogleFonts.quicksand(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            Text(
              widget.mobileNumber ?? "N/A",
              style: GoogleFonts.quicksand(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: (){
                requestBlood();
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.redAccent,
                ),
                child: const Text(
                  "Send Request",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        widget.bloodGroup ?? "N/A",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.redAccent,
                        ),
                      ),
                      Text(
                        "Blood Type",
                        style:GoogleFonts.quicksand(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                   Column(
                    children: [
                      Text(
                       widget.age 
                       
                       ?? "N/A",
                        style:GoogleFonts.quicksand(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.redAccent,
                        ),
                      ),
                      Text(
                        "Age",
                        style: GoogleFonts.quicksand(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                   Column(
                    children: [
                      Text(
                        widget.gender ?? "N/A",
                        style: GoogleFonts.quicksand(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.redAccent,
                        ),
                      ),
                      Text(
                        "Gender",
                        style: GoogleFonts.quicksand(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: Column(
                children: [
                  const Icon(Icons.location_on, size: 40),
                  Text(
                    widget.city ?? "N/A",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
             SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                 
                  Text(
                    "Ask them for blood",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}