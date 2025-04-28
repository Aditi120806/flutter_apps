import 'package:blood_buddy/availableDoners.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
String selectedbloodgroup="";
void main() {
  runApp(const Reciver());
}

class Reciver extends StatefulWidget {
  const Reciver({super.key});

  @override
  State createState() => _MainAppState();
}

class _MainAppState extends State {
  String? bloodGroup;
  String? country;
  String? state;
  String? district;
  String? city;
  
 TextEditingController receiverbloodgroupcontroller =TextEditingController();
 


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor:Colors.redAccent,
        toolbarHeight: 55,
        title: Text(
          "BloodBuddy",
          style: GoogleFonts.quicksand(
              fontSize: 24, fontWeight: FontWeight.w800, color: Colors.black),
          selectionColor: Colors.black,
        ),
        centerTitle: true,
        elevation: 10,
        //shadowColor:const Color.fromRGBO(255, 0, 82, 10) ,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                child: Text(
                  "Boold Group",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  
                ),
              ),
              TextField( controller: receiverbloodgroupcontroller,
              
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.water_drop),
                          hintText: "Blood Group",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                         onChanged: (text) {
              selectedbloodgroup = text;  // Update the selected blood group
            },
                      ),
              
              const SizedBox(
                child: Text(
                  "Country",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.pin_drop),
                          hintText: "Country",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
              const SizedBox(
                child: Text(
                  "State",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.pin_drop),
                          hintText: "State",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
              const SizedBox(
                child: Text(
                  "District",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
             TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.pin_drop),
                          hintText: "District",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
              const SizedBox(
                child: Text(
                  "City",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.pin_drop),
                          hintText: "city",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                          Colors.redAccent,
                        )),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const AvailableDonor();
                          }));
                         
                        },
                        child: const Text(
                          "Search",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      
    );
  }
}
