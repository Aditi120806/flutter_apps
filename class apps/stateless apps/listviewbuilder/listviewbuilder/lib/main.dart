import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(" list view builder demo",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600
          ),) ,
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: 40,
          physics:const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context,int index){
            return Text(
              "index : $index",
              style:const  TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,

              ),
            );
          },
        ),
      ),
    );
  }
}
