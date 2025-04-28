import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const Campaign()); // Create a MyApp widget that wraps MainApp
}

// Campaigns_model.dart
class CampaignsModel {
  String title;
  String location;
  String date;
  String time;
  CampaignsModel({
    required this.title,
    required this.location,
    required this.date,
    required this.time,
  });
}

class Campaign extends StatefulWidget {
  const Campaign({super.key});

  @override
  State<Campaign> createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  DateTime? _pickedDate;

  List<CampaignsModel> cards = []; // Initialize as empty list


  Future<void> saveDataToFirestore() async {
  try {
    // Access Firestore and add a document to a collection
    await FirebaseFirestore.instance.collection('campaigns').add({
      'name': nameController.text.trim(),
      'location': locationController.text.trim(),
      'time':timeController.text.trim(),
      'date': Timestamp.fromDate(_pickedDate!),
    });
    print("Data added successfully!");
  } catch (e) {
    print("Error adding data: $e");
  }
}

  void clearControllers() {
    nameController.clear();
    locationController.clear();
    dateController.clear();
    timeController.clear();
  }

  List<Color> colorCard = [
    const Color.fromARGB(255, 240, 112, 112),
    const Color.fromARGB(255, 236, 172, 89),
    const Color.fromARGB(255, 123, 235, 181),
    const Color.fromARGB(255, 221, 112, 240),
    const Color.fromARGB(255, 116, 163, 244)
  ];

  void showmyBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 12.0,
            left: 12.0,
            right: 12.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add Campaign",
                style: GoogleFonts.quicksand(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color:Colors.redAccent
                ),
              ),
              Row(
                children: [
                  Text(
                    "Name",
                    style: GoogleFonts.quicksand(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color:Colors.redAccent
                    ),
                  ),
                ],
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(255, 0, 82, 10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Location",
                    style: GoogleFonts.quicksand(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color:Colors.redAccent
                    ),
                  ),
                ],
              ),
              TextField(
                controller: locationController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(255, 0, 82, 10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Date",
                    style: GoogleFonts.quicksand(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color:Colors.redAccent
                    ),
                  ),
                ],
              ),
              TextField(
                controller: dateController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(255, 0, 82, 10),
                      ),
                    ),
                    suffixIcon: const Icon(Icons.date_range_outlined)),
                onTap: () async {
                 DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2030),
  );

  if (selectedDate != null) {
    setState(() {
      _pickedDate = selectedDate; // Save the selected date
      dateController.text = DateFormat('MMMM d, yyyy').format(_pickedDate!); // Format and display in TextField
    });
  }
                  
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Time",
                    style: GoogleFonts.quicksand(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color:Colors.redAccent
                    ),
                  ),
                ],
              ),
              TextField(
                controller: timeController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(255, 0, 82, 10),
                    ),
                  ),
                  suffixIcon: const Icon(Icons.av_timer),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                 
                  saveDataToFirestore();
                  clearControllers();
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color:Colors.redAccent,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      "Add",
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back, color: Colors.black)),
          title: Text(
            "Campaigns",
            style: GoogleFonts.quicksand(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.w700),
          ),
          leadingWidth: 30,
          toolbarHeight: 80,
          backgroundColor:Colors.redAccent
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('campaigns') // No filtering by blood group
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

            final campaignDocs = snapshot.data!.docs;

            return ListView.builder(
                  itemCount: campaignDocs.length,
                itemBuilder: (BuildContext context, int index) {
                  var campaign=campaignDocs[index];
                 // String date=campaign["date"].toString();
                  String formattedDate;
                    var dateField = campaign['date']; 
     if (dateField != null && dateField is Timestamp) {
      // Convert Timestamp to DateTime
      DateTime dateTime = dateField.toDate();
      formattedDate = DateFormat('MMMM d, yyyy').format(dateTime); // Format the DateTime
    } else {
      // If the date field is null or not a Timestamp, set a fallback string
      formattedDate = 'No date available';
    }
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 165,
                      width: 340,
                      decoration: BoxDecoration(
                        color: colorCard[index],
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
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    "assets/campaign.jpeg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
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
                                      height: 50,
                                      width: 200,
                                      child: Text(
                                        campaign['name'],
                                        style: GoogleFonts.quicksand(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: 150,
                                      height: 20,
                                      child: Text(
                                        formattedDate,
                                        style: GoogleFonts.quicksand(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                const Text(
                                 " campaign",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                const Icon(Icons.location_on),
                                Text(campaign["location"],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showmyBottomSheet(context);
          },
          backgroundColor:Colors.redAccent,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
      ),
    ),);
  }
}