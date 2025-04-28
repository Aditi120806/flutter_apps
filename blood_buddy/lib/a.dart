import 'package:flutter/material.dart';
import 'package:blood_buddy/organizationLoginPage.dart';
//import 'package:google_fonts/google_fonts.dart';
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
      
      body: Stack(
      
          children: [
              SizedBox(
                height: double.infinity,
                
              
                    child: Container(
                      height: 400,
                      decoration:const BoxDecoration(
                       borderRadius: BorderRadius.only(
                   bottomLeft: Radius.circular(30), // Circular border for bottom-left
                  bottomRight: Radius.circular(30), // Circular border for bottom-right
                   ),
                   color: Color.fromRGBO(255, 0, 82, 10)
                      ),
                    ),
              ),
            
           
            Positioned(
              top: 200,
              left: 16,
              right: 16,
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  
                ),
                child:Column(
                 
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const  SizedBox(
                    child: Text(
                    "Welcome To Our App",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      //color: Color.fromRGBO(255, 0, 82, 10),
                      
                    ),
                                    ),
                  ),
                  const SizedBox(
                      height: 20,
                    ),
                        SizedBox(
                height: 40,
                width: 200,
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                      Color.fromRGBO(255, 0, 82, 10),
                    )),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (e) => const PersonalLoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Donate",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ),
            
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 40,
              width: 200,
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                    Color.fromRGBO(255, 0, 82, 10),
                  )),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const Reciver();
                    }));
                  },
                  child: const Text(
                    "Reciever",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 40,
              width: 200,
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                    Color.fromRGBO(255, 0, 82, 10),
                  )),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const OrganizationLoginPage();
                    }));
                  },
                  child: const Text(
                    "Organization",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            )
                  ],
                ),
              ),
            ),
          ],
          
        
        
      ),
    );
  }
}
