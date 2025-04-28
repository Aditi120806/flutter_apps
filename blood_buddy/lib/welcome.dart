import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blood_buddy/persnolLoginPage.dart';
import 'package:blood_buddy/receiver.dart';

void main() {
  runApp(const Welcome());
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:  Stack(
        children: [
          // Blue background
          Container(
            height: MediaQuery.of(context).size.height * 0.4, // Cover 40% of the screen
            decoration: const BoxDecoration(
              color: Colors.redAccent, // Blue color
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Center(child: Text("Charity & Donation",
            style: GoogleFonts.quicksand(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.white
            ),)),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                height: 450,
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
                child: SingleChildScrollView(
                  child: Column(
                   mainAxisSize: MainAxisSize.min,
                    children: [
                     const  SizedBox(
                        height: 20,
                      ),
                      const SizedBox(width: 280,),
                        SizedBox(
                          width: 200,
                      child: Center(
                        child: Text(
                        "Welcome to Blood Buddy",
                        style: GoogleFonts.quicksand(
                          fontSize: 27
                          ,
                          fontWeight: FontWeight.w800,
                          
                          
                        ),
                                        ),
                      ),
                    ),
                    const SizedBox(
                        height: 40,
                      ),
                          SizedBox(
                  height: 40,
                  width: 200,
                  child: Bounce(
                    duration:const  Duration(milliseconds: (200)),
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.redAccent,
                        ),
                        child: Center(
                          child:  Text(
                            "Login",
                            style: GoogleFonts.quicksand(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w600),
                          ),
                        ),
                        ),
                        
                        onTap: () {
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (e) => const PersonalLoginPage(),
                            ),
                          );
                        },
                  ),
                                ),
                              
                              const SizedBox(
                                height: 30,
                              ),
                              Bounce(duration: const Duration(milliseconds: (200)),
                                child: SizedBox(
                  height: 40,
                  width: 200,
                  
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                          Colors.redAccent,
                        )),
                        
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const Reciver();
                          }));
                        },
                        child:  Text(
                          "Need blood",
                          style: GoogleFonts.quicksand(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w600),
                        )),
                        
                  ),
                  
                                ),
                              
                              const SizedBox(
                                height: 40,
                              ),
                               SizedBox(
                                width: 250,
                                child: Text("**In urgent case you can search for blood using need blood button",style: GoogleFonts.poppins()),
                              ),
                              // SizedBox(
                              //   height: 40,
                              //   width: 200,
                              //   child: ElevatedButton(
                              //       style: const ButtonStyle(
                              //           backgroundColor: WidgetStatePropertyAll(
                              //         Colors.redAccent,
                              //       )),
                              //       onPressed: () {
                              //         Navigator.of(context)
                              //             .push(MaterialPageRoute(builder: (context) {
                              //           return const OrganizationLoginPage();
                              //         }));
                              //       },
                              //       child:  Text(
                              //         "Blood Bank Login",
                              //         style: GoogleFonts.quicksand(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w600),
                              //       )),
                              // )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
