import 'dart:developer';

import 'package:blood_buddy/customsnackbar.dart';
//import 'package:blood_buddy/home.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const OrganizationSignUp());
}

class OrganizationSignUp extends StatefulWidget {
  const OrganizationSignUp({super.key});
  @override
  State createState() => _OrganizationSignUpState();
}

class _OrganizationSignUpState extends State {
  String? bloodGroup;
  String? country;
  String? state;
  String? district;
  String? city;
  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _phonecontroller=TextEditingController();
  final TextEditingController _bloodgroupcontroller=TextEditingController();
  final TextEditingController _statecontroller=TextEditingController();
  final TextEditingController _districtcontroller=TextEditingController();
  final TextEditingController _citycontroller=TextEditingController();
  final TextEditingController _passwordcontroller=TextEditingController();
    final TextEditingController _licensecontroller=TextEditingController();
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  void dropdownCallBackBloodGroup(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        bloodGroup = selectedValue;
      });
    }
  }

  void dropdownCallBackCountry(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        country = selectedValue;
      });
    }
  }

  void dropdownCallBackState(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        state = selectedValue;
      });
    }
  }

  void dropdownCallBackDistrict(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        district = selectedValue;
      });
    }
  }

  void dropdownCallBackCity(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        city = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 0, 82, 10),
        toolbarHeight: 60,
        title: Text(
          "BloodBuddy",
          style: GoogleFonts.ubuntu(
              fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
          selectionColor: Colors.white,
        ),
        centerTitle: true,
        elevation: 10,
        //shadowColor:const Color.fromRGBO(255, 0, 82, 10) ,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
             
              SizedBox(
                  //height: 100,
                  //width: 100,
                  child: Image.asset("assets/images6.jpg")),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                // Name
              ),
              const SizedBox(
                height: 10,
              ),
               TextField(
                controller: _phonecontroller,
                decoration: const InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                // Mobile No
              ),
              const SizedBox(
                height: 10,
              ),
              // const SizedBox(
              //   child: Text(
              //     "Country",
              //     style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              //   ),
              // ),
             TextField(
                controller: _statecontroller,
                decoration: const InputDecoration(
                  hintText: "state",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                // Mobile No
              ),
              const SizedBox(
                height: 10,
              ),
              // const SizedBox(
              //   child: Text(
              //     "State",
              //     style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              //   ),
              // ),
             TextField(
                controller: _citycontroller,
                decoration: const InputDecoration(
                  hintText: "city",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                // Mobile No
              ),
              const SizedBox(
                height: 10,
              ),
              // const SizedBox(
              //   child: Text(
              //     "District",
              //     style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              //   ),
              // ),

              TextField(
                controller: _districtcontroller,
                decoration: const InputDecoration(
                  hintText: "district",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                // Mobile No
              ),
              const SizedBox(
                height: 10,
              ),
              // const SizedBox(
              //   child: Text(
              //     "City",
              //     style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              //   ),
              // ),

             TextField(
                controller: _bloodgroupcontroller,
                decoration: const InputDecoration(
                  hintText: "Blood group",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                // Mobile No
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _licensecontroller,
                decoration: const InputDecoration(
                  hintText: "license no",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                // Mobile No
              ),
              // Row(
              //   children: [Checkbox(value: false, onChanged: () {}),Text("your age is uner 18 to 65")],

              // ),
              //  const SizedBox(
              //   height: 15,
              // ),
              // Row(
              //   children: [Checkbox(value: false, onChanged: () {}),Text("agree all terms and conditions")],

              // ),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 70,
                    child:  TextField(
                      controller: _passwordcontroller,
                      decoration:const  InputDecoration(
                        hintText: "Password",
                      ),
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    width: 40,
                    child: Icon(Icons.visibility_off),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 70,
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Re-Password",
                      ),
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    width: 40,
                    child: Icon(Icons.visibility_off),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromRGBO(255, 0, 82, 10))),
                  onPressed: () async {
                    if(_phonecontroller.text.trim().isNotEmpty && _passwordcontroller.text.trim().isNotEmpty){
                      try {
                        UserCredential userCredential=
                        await  _firebaseAuth.createUserWithEmailAndPassword(email: _phonecontroller.text.trim(), password: _passwordcontroller.text.trim(),);
                        log("user credentials: $userCredential");
                        Customsnackbar.showcustomsnackbar(message: "user sign in successfully", context: context);
                        Navigator.of(context).pop();
                      }
                      on FirebaseAuthException catch (error){
                        print(error.code);
                        print("${error.message}");
                        Customsnackbar.showcustomsnackbar(message: error.message!, context: context);

                      }
                    }
                    else{
                      Customsnackbar.showcustomsnackbar(message: "please enter valid code", context: context);
                    }
                    
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
