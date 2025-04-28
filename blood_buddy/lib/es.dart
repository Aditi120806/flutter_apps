import 'package:blood_buddy/findDonor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:blood_buddy/campaigns.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State createState() => _Home();
}

class _Home extends State {
  int menuIndex = 0;
  @override
  Widget build(BuildContext context) {
    final items = [
      const Icon(Icons.home, size: 30),
      const Icon(Icons.search, size: 30),
      const Icon(Icons.add, size: 30),
      const Icon(Icons.list, size: 30),
      const Icon(Icons.person, size: 30),
    ];
    return Scaffold(
      
      body: Stack(
        children: [
            Container(
               height: double.infinity,
            decoration:const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromRGBO(255, 0, 82, 10),Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            //main column for overall layout
            
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    //for welcome and notification icon
                    children: [
                      Text(
                        "WELCOME",
                        style: GoogleFonts.ubuntu(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.notifications_rounded,
                            size: 35,
                            color: Color.fromRGBO(255, 0, 82, 10),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "DHRUV CHAUHAN",
                    style:
                        GoogleFonts.ubuntu(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    //for donation drive posters
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: 200,
                          width: 280,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(156, 227, 227, 227),
                              borderRadius: BorderRadius.circular(25)),
                          child: Image.asset(
                            "assets/images2.jpeg",
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 200,
                          width: 280,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(156, 227, 227, 227),
                              borderRadius: BorderRadius.circular(25)),
                          child: Image.asset(
                            "assets/images.jpeg",
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 200,
                          width: 280,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(156, 227, 227, 227),
                              borderRadius: BorderRadius.circular(25)),
                          child: Image.asset(
                            "assets/images3.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 200,
                          width: 280,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(156, 227, 227, 227),
                              borderRadius: BorderRadius.circular(25)),
                          child: Image.asset(
                            "assets/poster3.PNG",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    //for buttons of campaigns,donate,find donor and donation request
                    height: 280,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(156, 227, 227, 227),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              //campaign container
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (context) {
                                    return const Campaign();
                                  }));
                                },
                                child: Container(
                                  height: 110,
                                  width: 108,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Icon(
                                        Icons.campaign,
                                        size: 50,
                                        color: Color.fromRGBO(255, 0, 82, 10),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "CAMPAIGNS",
                                        style: GoogleFonts.ubuntu(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              //donate container
                              Container(
                                height: 110,
                                width: 108,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Icon(
                                      Icons.volunteer_activism_rounded,
                                      size: 50,
                                      color: Color.fromRGBO(255, 0, 82, 10),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "DONATE",
                                      style: GoogleFonts.ubuntu(
                                          fontWeight: FontWeight.w900, fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              const Spacer(),
                              //find donor container
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (context) {
                                    return const FindDonor();
                                  }));
                                },
                                child: Container(
                                  height: 110,
                                  width: 108,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Icon(
                                        Icons.person_search_rounded,
                                        size: 50,
                                        color: Color.fromRGBO(255, 0, 82, 10),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "FIND DONOR",
                                        style: GoogleFonts.ubuntu(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //donation request text
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "DONATION REQUEST",
                                style: GoogleFonts.ubuntu(
                                    fontSize: 17, fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //first container in donation request
                              Container(
                                height: 96,
                                width: 270,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromRGBO(255, 0, 82, 10),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 190,
                                        ),
                                        Text(
                                          "5 MIN AGO",
                                          style: GoogleFonts.ubuntu(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w800),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.person_2_rounded,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                              child: Text(
                                            "DHRUV CHAUHAN",
                                            style: GoogleFonts.ubuntu(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800),
                                          ))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.place,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                              height: 40,
                                              width: 200,
                                              child: Text(
                                                "RAJDHANI MULTISPECIALITY HOSPITAL",
                                                style: GoogleFonts.ubuntu(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13),
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 90,
                                width: 270,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color.fromRGBO(255, 0, 82, 10),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 190,
                                        ),
                                        Text(
                                          "5 MIN AGO",
                                          style: GoogleFonts.ubuntu(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w800),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.person_2_rounded,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                              child: Text(
                                            "DHRUV CHAUHAN",
                                            style: GoogleFonts.ubuntu(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800),
                                          ))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.place,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                              height: 40,
                                              width: 200,
                                              child: Text(
                                                "RAJDHANI MULTISPECIALITY HOSPITAL",
                                                style: GoogleFonts.ubuntu(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13),
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 100,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 239, 236, 236),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.person_add,
                            size: 40,
                            color: Color.fromRGBO(255, 0, 82, 10),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text("INVITE YOUR FRIEND!",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 15, fontWeight: FontWeight.w700)),
                              SizedBox(
                                  height: 35,
                                  width: 300,
                                  child: Text(
                                    "invite your friend or family memebers to donate blood",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 13, fontWeight: FontWeight.w400),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
                    
          ),],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: const Color.fromRGBO(255, 0, 82, 10),
        color: const Color.fromRGBO(255, 0, 82, 10),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 500),
        // animationCurve: Curves.linear,
        height: 60,
        backgroundColor: Colors.white,
        items: items,
        index: menuIndex,
        onTap: (index) => setState(() => menuIndex = index),
      ),
    );
  }
}
