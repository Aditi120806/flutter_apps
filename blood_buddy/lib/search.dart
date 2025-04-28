// import 'package:blood_buddy/home.dart';
import 'package:blood_buddy/donar_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Search());
}

class Search extends StatefulWidget {
  const Search({super.key});
  @override
  State createState() => _Search();
}

class _Search extends State {
  String searchQuery = '';
  final TextEditingController _searchcontroller= TextEditingController ();
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
         appBar:  AppBar(
  toolbarHeight: 120,
  flexibleSpace: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.redAccent, Colors.red[700]!],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80),bottomRight: Radius.circular(80),)
    ),
  ),
  title: Text(
    "BloodBuddy",
    style: GoogleFonts.ubuntu(
      fontSize: 25,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
  ),
  centerTitle: true,
  elevation: 10,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(500)),
  ),
),
      body:  Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                 
                decoration:const BoxDecoration(color:Colors.redAccent,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
              ),
            ),
          Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                   width: MediaQuery.of(context).size.width ,
                  child: SearchBar(
                    // shadowColor: WidgetStatePropertyAll(
                    //   Color.fromRGBO(255, 0, 82, 10),
                    // ),
                    controller: _searchcontroller,
                    onChanged: (value){
                      setState(() {
                        searchQuery = value.trim();
                      });
                    },
                    leading: const Icon(Icons.search),
                    hintText: "Search blood group ",
                  ),
                ),
                
              ),
            
          ],
        ),
        
        StreamBuilder(
  stream: searchQuery.isEmpty
      ? FirebaseFirestore.instance.collection('donors').snapshots()
      : FirebaseFirestore.instance
          .collection('donors')
          .where('bloodGroup', isEqualTo: searchQuery) // Assuming blood groups are stored in uppercase
          .snapshots(),
  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
      return const Center(child: Text("No matching donors found"));
    }

    final donorDocs = snapshot.data!.docs;

    return Expanded(
      child: ListView.builder(
          itemCount:donorDocs.length ,
          itemBuilder: (BuildContext context, int index) {
            var donor = donorDocs[index];
            String mobileNumber = donor['mobile'].toString(); 
            String name = donor['name'].toString(); 
            String bloodgroup = donor['bloodGroup'].toString(); 
            String location = donor['city'].toString(); 
            String age = donor['age'].toString(); 
            String gender = donor['gender'].toString(); 

            
            // Color containerColor = colors[index % colors.length];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                   
                  return  DonarProfile(mobileNumber: mobileNumber,name: name,bloodGroup: bloodgroup,city: location,age: age,gender: gender,);
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
                            borderRadius: BorderRadius.circular(50), // Set the corner radius
                            child: Image.asset(
                              "assets/blood1.png",
                              fit: BoxFit.cover,
                            ),
                              )
                          ),
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 150,
                                  height: 20,
                                  child: Text(
                                    donor['bloodGroup'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                 SizedBox(
                                  height: 40,
                                  width: 200,
                                  child: Row(
                                    children: [
                                      Text(
                                        mobileNumber,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const Spacer(),
                                      const Icon(Icons.location_on),
                                      Text(donor['city']),
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
        ),
    );
  },
)

        ],
        
      ),
    );
  }
}
