
import 'package:blood_buddy/receiverprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwipeableSections extends StatelessWidget {
  const SwipeableSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Blood requests",style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.w700),),
      ),
      body:StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('requests') // No filtering by blood group
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

            final requestDocs = snapshot.data!.docs;

            return ListView.builder(
              itemCount: requestDocs.length,
              itemBuilder: (BuildContext context, int index) {
                var request = requestDocs[index];
                String MobileNumber = request['mobile'].toString();
                String Name = request['name'];
                String bloodgroup = request['bloodgroup'];
                String City = request['city'];

                // Color containerColor = colors[index % colors.length];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return receiverProfile(
                          mobileNumber: MobileNumber,
                          name: Name,
                          bloodgroup: bloodgroup,
                          requestId:request.id,
                          city: City);
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 150,
                      width: 350,
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
                                       request['name'],
                                        style: GoogleFonts.quicksand(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    SizedBox(
                                      width: 150,
                                      height: 27,
                                      child: Text(
                                       request['bloodgroup'],
                                        style: GoogleFonts.quicksand(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 200,
                                      child: Row(
                                        children: [
                                          Text(
                                            MobileNumber,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const Spacer(),
                                          const Icon(Icons.location_on),
                                          Text(request['city'],style: const TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500),),
                                          const Spacer(),
                                          //Icon(Icons.delete),
                                       
         
                                        ],
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Container(
                                    //     height: 30,
                                    //     width: 120,
                                    //     child: Center(child: Text("accept request",style: TextStyle(
                                    //           fontSize: 12,
                                    //           fontWeight: FontWeight.w500),)),
                                    //     decoration: BoxDecoration(
                                    //       color: Colors.white,
                                    //       borderRadius: BorderRadius.circular(20)
                                    //     ),
                                    //   ),
                                    // )
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
        )
    );
  }
}



