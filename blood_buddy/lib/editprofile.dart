import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // Controllers for user input
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController bloodgroupController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Load user data from Firestore
  void _loadUserData() async {
    if (currentUser != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('donors')
          .doc(currentUser!.uid)
          .get();

      if (userDoc.exists) {
        final data = userDoc.data();
        setState(() {
          nameController.text = data?['name'] ?? '';
          emailController.text = data?['email'] ?? '';
          phoneController.text = data?['mobile'] ?? '';
          bloodgroupController.text = data?['bloodGroup'] ?? '';
          cityController.text = data?['city'] ?? '';
          stateController.text = data?['state'] ?? '';

        });
      }
    }
  }

  // Save updated profile data to Firestore
  Future<void> _saveProfile() async {
    try {
      await FirebaseFirestore.instance
          .collection('donors')
          .doc(currentUser!.uid)
          .update({
        'name': nameController.text,
        'email': emailController.text,
        'mobile': phoneController.text,
         'bloodGroup': bloodgroupController.text,
          'city': cityController.text,
           'state': stateController.text,

      });
      await currentUser!.updateDisplayName(nameController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating profile: $e')),
      );
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(246, 205, 247, 247) ,
      appBar: AppBar(
        title: Text("Edit Profile",style: GoogleFonts.quicksand(fontWeight: FontWeight.w700),),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name",
                 border: OutlineInputBorder(),),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email",
                 border: OutlineInputBorder(),),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: "Phone Number",
                 border: OutlineInputBorder(),),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: bloodgroupController,
                decoration: const InputDecoration(labelText: "bloodGroup",
                 border: OutlineInputBorder(),),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: cityController,
                decoration: const InputDecoration(labelText: "city",
                 border: OutlineInputBorder(),),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: stateController,
                decoration: const InputDecoration(labelText: "state",
                 border: OutlineInputBorder(),),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _saveProfile,
                  style: const ButtonStyle(
                    backgroundColor:WidgetStatePropertyAll(Colors.redAccent)
                  ),
                  child: Text("DONE",style: GoogleFonts.quicksand(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
