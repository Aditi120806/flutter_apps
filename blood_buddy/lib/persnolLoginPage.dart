import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blood_buddy/home.dart';
import 'personalSignUp.dart';

import 'customsnackbar.dart';
import 'sessinData.dart';

void main() {
  runApp(const PersonalLoginPage());
}

class PersonalLoginPage extends StatefulWidget {
  const PersonalLoginPage({super.key});

  @override
  State<PersonalLoginPage> createState() => _PersonalLoginPageState();
}

class _PersonalLoginPageState extends State<PersonalLoginPage> {
  final TextEditingController _emailcontroller=TextEditingController();
  final TextEditingController _passwordcontroller=TextEditingController();
    bool _isPasswordVisible=false;
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body:Stack(
        children: [
          // Blue background
          Container(
            height: MediaQuery.of(context).size.height * 0.4, // Cover 40% of the screen
            decoration: const BoxDecoration(
              color: Colors.redAccent,// Blue color
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                     Text(
                      "Login",
                      style: GoogleFonts.quicksand(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Email field
                    TextField(
                      controller: _emailcontroller,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.account_circle),
                        hintText: "email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Password field
                    TextField(
                      obscureText: !_isPasswordVisible,
                      controller: _passwordcontroller,
                      
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon:  IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible; // Toggle state
                  });
                },
              ),
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    
                    const SizedBox(height: 20),
                    ElevatedButton(
                    onPressed: () async {
  if (_emailcontroller.text.trim().isNotEmpty && _passwordcontroller.text.trim().isNotEmpty) {
    try {
      // Declare userCredential outside of try block to use later
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: _emailcontroller.text,
        password: _passwordcontroller.text,
      );

      log("bloodbuddy: usercredentials:${userCredential.user!.email}");

      // Navigate to Home screen after successful login
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const Home();
          },
        ),
      );

      // Store session data after navigation to avoid blocking the UI
      await SessionData.storeSessionData(
        loginData: true,
        emailId: userCredential.user!.email!,
      );
    } on FirebaseAuthException catch (error) {
      log("bloodbuddy :error :${error.code}");
      log("bloodbuddy :error :${error.message}");
      Customsnackbar.showcustomsnackbar(message: error.code, context: context);
    }
  }
},

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 18,
                        color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("- OR -"),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 4,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Icon(
                        Icons.g_translate,
                        color: Colors.redAccent,
                        size: 30,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an Account? "),
                        GestureDetector(
                          onTap: () { Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const SignupPersonal();
                }));},
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
