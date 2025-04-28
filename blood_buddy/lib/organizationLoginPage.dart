import 'dart:developer';

import 'package:blood_buddy/customsnackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blood_buddy/home.dart';
import 'package:blood_buddy/organizationSignUp.dart';

void main() {
  runApp(const OrganizationLoginPage());
}

class OrganizationLoginPage extends StatelessWidget {
  const OrganizationLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
      TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
    final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
    return Scaffold(
      body:Stack(
        children: [
          // Blue background
          Container(
            height: MediaQuery.of(context).size.height * 0.4, // Cover 40% of the screen
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 0, 82, 10), // Blue color
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
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.account_circle),
                        hintText: "Username or mobile ",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Password field
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("Forgot Password?"),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (route) {
                    return const Home();
                  }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(255, 0, 82, 10),
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
                      onPressed: () async{
                          if (emailcontroller.text.trim().isNotEmpty && passwordcontroller.text.trim().isNotEmpty)
                        {
                          try{
                            UserCredential userCredential=await  firebaseAuth.signInWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text) ;
                            
   
                          log("bloodbuddy: usercredentials:${userCredential.user!.email}");
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context){
                                return const Home(
                                  );
                              },
                            ),
                          );
                          }
                          on FirebaseAuthException catch(error){
                            log("bloodbuddy :error :${error.code}");
                             log("bloodbuddy :error :${error.message}");
                          Customsnackbar.showcustomsnackbar(message:error.code , context: context);
                          }


                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 4,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Icon(
                        Icons.g_translate,
                        color: Color.fromRGBO(255, 0, 82, 10),
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
                  return const OrganizationSignUp();
                }));},
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 0, 82, 10),
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
