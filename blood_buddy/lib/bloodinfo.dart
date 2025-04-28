import 'package:flutter/material.dart';

void main() {
  runApp(const BloodInfoApp());
}

class BloodInfoApp extends StatelessWidget {
  const BloodInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BloodTypeInfo(),
    );
  }
}

class BloodTypeInfo extends StatelessWidget {
  final List<Map<String, dynamic>> bloodTypes = [
    {
      'type': 'A+',
      'donors': 'A+, A-, O+, O-',
      'receivers': 'A+, AB+',
      'color': Colors.red[200]
    },
    {
      'type': 'A-',
      'donors': 'A-, O-',
      'receivers': 'A+, A-, AB+, AB-',
      'color': Colors.red[300]
    },
    {
      'type': 'B+',
      'donors': 'B+, B-, O+, O-',
      'receivers': 'B+, AB+',
      'color': Colors.blue[200]
    },
    {
      'type': 'B-',
      'donors': 'B-, O-',
      'receivers': 'B+, B-, AB+, AB-',
      'color': Colors.blue[300]
    },
    {
      'type': 'O+',
      'donors': 'O+, O-',
      'receivers': 'All Positive Blood Types',
      'color': Colors.green[200]
    },
    {
      'type': 'O-',
      'donors': 'O-',
      'receivers': 'All Blood Types',
      'color': Colors.green[300]
    },
    {
      'type': 'AB+',
      'donors': 'All Blood Types',
      'receivers': 'AB+',
      'color': Colors.purple[200]
    },
    {
      'type': 'AB-',
      'donors': 'AB-, A-, B-, O-',
      'receivers': 'AB+, AB-',
      'color': Colors.purple[300]
    },
  ];

   BloodTypeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(246, 205, 247, 247),
      appBar: AppBar(
        title: const Text(
          "Blood Type Information",
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
        centerTitle: true,
         shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        backgroundColor:Colors.redAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: bloodTypes.length,
        itemBuilder: (context, index) {
          final bloodType = bloodTypes[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: bloodType['color'],
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Blood Type: ${bloodType['type']}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Can Donate To: ${bloodType['receivers']}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Can Receive From: ${bloodType['donors']}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
