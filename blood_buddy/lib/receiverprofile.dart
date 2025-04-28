import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'customsnackbar.dart';

class receiverProfile extends StatefulWidget {
  final String? mobileNumber;
  final String? name;
  final String? bloodgroup;
  final String? city;
   final requestId;

  const receiverProfile({
    super.key,
    this.mobileNumber,
    this.name,
    this.bloodgroup,
    this.city,
    this.requestId,
  });
  
   

  @override
  State<receiverProfile> createState() => _DonarProfileState();
}

class _DonarProfileState extends State<receiverProfile> {
 
     
  @override
  Widget build(BuildContext context) {
    Future<void> deleteRequest(String requestId) async {
  try {
    // Reference the document in the 'requests' collection with the specific ID
    DocumentReference requestRef = FirebaseFirestore.instance.collection('requests').doc(requestId);

    // Delete the document
    await requestRef.delete();

    // Show success message using custom SnackBar
    Customsnackbar.showcustomsnackbar(
      message: "Request deleted successfully!",
      context: context,
    );
  } catch (e) {
    // Show error message if the deletion fails
    Customsnackbar.showcustomsnackbar(
      message: "Failed to delete request: $e",
      context: context,
    );
  }
}
void showCustomNotification(BuildContext context) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 300.0, // Position on the screen
      left: 60,
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: 160,
          width: 290,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color:Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Text(
            'Thank you for accepting request ...further process will be done after getting acknowledgement from user',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    ),
  );

  // Insert the notification into the overlay
  overlay.insert(overlayEntry);

  // Remove the notification after a delay
  Future.delayed(const Duration(seconds: 4), () {
    overlayEntry.remove();
  });
}
    return Scaffold(
      backgroundColor: const Color.fromARGB(246, 205, 247, 247),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        toolbarHeight: 55,
        title: Text(
          "Receiver  Profile",
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
              height: 10,
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
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            Text(
              widget.mobileNumber ?? "N/A",
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: (){
                showCustomNotification(context);
                deleteRequest(widget.requestId!);
                
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
                  "Accept request",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
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
                        widget.bloodgroup ?? "N/A",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color:Colors.redAccent,
                        ),
                      ),
                      const Text(
                        "Blood Type",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Text(
                        "20",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.redAccent,
                        ),
                      ),
                      Text(
                        "Donated",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Text(
                        "02",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.redAccent,
                        ),
                      ),
                      Text(
                        "Requested",
                        style: TextStyle(
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
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
              SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                 
                  Text(
                    "help them for blood",
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