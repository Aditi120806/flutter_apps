//import 'package:blood_buddy/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'customsnackbar.dart';
import 'dart:developer';

void main() {
  runApp(const SignupPersonal());
}

class SignupPersonal extends StatefulWidget {
  const SignupPersonal({super.key});
  @override
  State createState() => _SignupPersonal();
}

class _SignupPersonal extends State {
  String? bloodGroup;
  String? country;
  String? state;
  String? district;
  String? city;
  String? age;
  String? gender;
  bool _isPasswordVisible = false; 
  final TextEditingController _nameController=TextEditingController();
   final TextEditingController _agecontroller=TextEditingController();
    final TextEditingController _gendercontroller=TextEditingController();
  final TextEditingController _emailcontroller=TextEditingController();
  final TextEditingController _bloodgroupcontroller=TextEditingController();
  final TextEditingController _statecontroller=TextEditingController();
  final TextEditingController _mobileController=TextEditingController();
  final TextEditingController _citycontroller=TextEditingController();
  final TextEditingController _passwordcontroller=TextEditingController();
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
// to add data in firestore




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
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
               decoration: const InputDecoration(labelText: "Name",
               border: OutlineInputBorder(),),
                // Name
              ),
              const SizedBox(
                height: 10,
              ),
               TextField(
                controller: _emailcontroller,
                 decoration: const InputDecoration(labelText: "Email",
               border: OutlineInputBorder(),),
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
                 decoration: const InputDecoration(labelText: "State",
               border: OutlineInputBorder(),),
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
                 decoration: const InputDecoration(labelText: "City",
               border: OutlineInputBorder(),),
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
                controller: _mobileController,
                decoration: const InputDecoration(labelText: "Phone no",
               border: OutlineInputBorder(),),
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
             decoration: const InputDecoration(labelText: "bloodgroup",
               border: OutlineInputBorder(),),
                // Mobile No
              ),
              const SizedBox(
                height: 15,
              ),
              
             TextField(
                controller: _agecontroller,
             decoration: const InputDecoration(labelText: "age",
               border: OutlineInputBorder(),),
                // Mobile No
              ),
               const SizedBox(
                height: 15,
              ),
              
              TextField(
                controller: _gendercontroller,
             decoration: const InputDecoration(labelText: "gender",
               border: OutlineInputBorder(),),
                // Mobile No
              ),
               const SizedBox(
                height: 15,
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
                    width: 368,
                    child:  TextField(
                       obscureText: !_isPasswordVisible,
                      controller: _passwordcontroller,
                     decoration: InputDecoration(labelText: "Password",
               border: const OutlineInputBorder(),
               suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible; // Toggle state
                  });
                },
              ),),
                    ),
                  ),
                
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Colors.redAccent,)),
                  onPressed: () async {
                    if(_emailcontroller.text.trim().isNotEmpty && _passwordcontroller.text.trim().isNotEmpty){
                      try {
                        UserCredential userCredential=
                        await  _firebaseAuth.createUserWithEmailAndPassword(email: _emailcontroller.text.trim(), password: _passwordcontroller.text.trim(),);
                        String uid = userCredential.user!.uid;
                        await FirebaseFirestore.instance.collection('donors').doc(uid).set({
          'uid': uid,
          'name': _nameController.text.trim(),
           'mobile': int.parse(_mobileController.text.trim()),
          'email': _emailcontroller.text.trim(),
          'bloodGroup': _bloodgroupcontroller.text.trim(),
          'city': _citycontroller.text.trim(),
          'state': _statecontroller.text.trim(),
          'age':int.parse(_agecontroller.text.trim()),
          'gender':_gendercontroller.text.trim(),
         
        });
        User? user = userCredential.user;
      if (user != null) {
  await user.updateDisplayName(_nameController.text.trim());
  await user.reload(); // Reload to apply the changes
  user = FirebaseAuth.instance.currentUser; // Refresh the user object after reload
}
         Customsnackbar.showcustomsnackbar(
          message: "User signed up and data saved successfully!",
          context: context,
        );

                        log("USER CREDENTIALS: $userCredential");
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
                    }// authentication ends
                    //saveDataToFirestore();

                  Navigator.of(context).pop();  
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
