import 'package:blood_buddy/donar_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const FindDonor()); // Create a MyApp widget that wraps MainApp
}

class FindDonor extends StatefulWidget {
  const FindDonor({super.key});

  @override
  State<FindDonor> createState() => _FindDonorState();
}

class _FindDonorState extends State<FindDonor> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          toolbarHeight: 55,
          title: Text(
            "Find Doners",
            style: GoogleFonts.ubuntu(
                fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black),
            selectionColor: Colors.white,
          ),
          centerTitle: true,
          elevation: 10,
          //shadowColor:const Color.fromRGBO(255, 0, 82, 10) ,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('donors') // No filtering by blood group
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('No donors found.'),
              );
            }

            

            final donorDocs = snapshot.data!.docs;

            return ListView.builder(
              itemCount: donorDocs.length,
              itemBuilder: (BuildContext context, int index) {
                var donor = donorDocs[index];
                String MobileNumber = donor['mobile'].toString();
                String Name = donor['name'];
                String BloodGroup = donor['bloodGroup'];
                String City = donor['city'];
                String gender= donor['gender'];
                String age=donor['age'].toString();

                // Color containerColor = colors[index % colors.length];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return DonarProfile(
                          mobileNumber: MobileNumber,
                          name: Name,
                          bloodGroup: BloodGroup,
                          city: City,
                          gender: gender,
                          age: age,
                          );
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 150,
                      width: 350,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(246, 205, 247, 247),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                  height: 100,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        50), // Set the corner radius
                                    child: Image.asset(
                                      "assets/blood1.png",
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      width: 200,
                                      child: Text(
                                        donor['name'],
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: 150,
                                      height: 25,
                                      child: Text(
                                        donor['bloodGroup'],
                                        style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 200,
                                      child: Row(
                                        children: [
                                          Text(
                                            MobileNumber,
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const Spacer(),
                                          const Icon(Icons.location_on),
                                          Text(donor['city']),
                                          const Spacer(),
                                          //Icon(Icons.delete),
                                       
         
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}