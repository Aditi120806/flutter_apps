import 'package:blood_buddy/receiver.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'donar_profile.dart';

void main() {
  runApp(const AvailableDonor());
}

class AvailableDonor extends StatefulWidget {
  const AvailableDonor({super.key});

  @override
  State<AvailableDonor> createState() => _AvailableDonorState();
}

class _AvailableDonorState extends State<AvailableDonor> {
  // String selectedbloodgroup = "A+"; // Example blood group; replace with dynamic value if needed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        toolbarHeight: 55,
        title: Text(
          "Available Donors",
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
      body: selectedbloodgroup.isEmpty
          ? const Center(
              child: Text(
                'Please select a blood group.',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.red),
              ),
            )
          : StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('donors')
                  .where('bloodGroup', isEqualTo: selectedbloodgroup)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                      child:
                          Text("No donors available for $selectedbloodgroup"));
                }

                final donorDocs = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: donorDocs.length,
                  itemBuilder: (BuildContext context, int index) {
                    var donor = donorDocs[index];
                    // Ensure to convert any numeric fields to String as required
                    String mobileNumber =
                        donor['mobile'].toString(); // Convert to String
                    String donorName =
                        donor['name'] ?? "No Name"; // Default to "No Name"
                    String donorBloodGroup = donor['bloodGroup'] ?? "Unknown";
                    String donorCity = donor['city'] ?? "Unknown";

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DonarProfile(
                            name: donorName,
                            mobileNumber: mobileNumber,
                            bloodGroup: donorBloodGroup,
                            city: donorCity,
                          ),
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 130,
                          width: 330,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(246, 205, 247, 247) ,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Image.asset("assets/blood1.png",
                                        fit: BoxFit.cover),
                                  ),
                                  const SizedBox(width: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 25,
                                          width: 200,
                                          child: Text(
                                            donorName,
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        const SizedBox(height: 7),
                                        SizedBox(
                                          width: 150,
                                          height: 20,
                                          child: Text(
                                            donorBloodGroup,
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                          width: 220,
                                          child: Row(
                                            children: [
                                              Text(
                                                mobileNumber,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(width: 10),
                                              const Icon(Icons.location_on),
                                              Text(donorCity),
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
            ),
    );
  }
}
