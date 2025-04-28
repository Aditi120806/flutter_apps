import 'package:blood_buddy/bloodinfo.dart';
import 'package:blood_buddy/blooddonationinfoui.dart';
import 'package:blood_buddy/myhomepage.dart';
import 'package:blood_buddy/profilepage.dart';
import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'search.dart';


void main() {
  runApp( const MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  
   const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int menuIndex = 0;
   List <Widget> screens=[
        Myhomepage(),
      const Search(),
      const BloodInfoApp(),
       const BloodDonationInfoUI(),
      const Profilepage(),
     
    ];

  @override
  Widget build(BuildContext context) {
    final items = [
      const Icon(Icons.home, size: 30),
      const Icon(Icons.search, size: 30),
    const Icon(Icons.water_drop, size: 30),
      const Icon(Icons.list, size: 30),
      const Icon(Icons.person, size: 30),
    ];
 
  


    return Scaffold(
      body:screens[menuIndex],
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.redAccent,
        color:Colors.redAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 500),
        height: 60,
        backgroundColor: Colors.white,
        items: items,
        index: menuIndex,
        onTap: (index) {
          Future.delayed(const Duration(milliseconds: 100),(){
          setState(() {menuIndex = index;
          });
        });
    
  },
      ),
    );


}
}
