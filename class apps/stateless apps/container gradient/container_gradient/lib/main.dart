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
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title:const Text("Netflix demo",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children:[
                Container(
                height: 200,
                width: 200,
                alignment: Alignment.bottomLeft,
                decoration:const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors:[
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(255, 173, 39, 83),
                  ]
                ),
              ),
                      ),
              const SizedBox(
                height: 10,
               ),
                Container(
                height: 200,
                width: 200,
                alignment: Alignment.bottomLeft,
                decoration:const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors:[
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(255, 173, 39, 83),
                  ]
                ),
              ),
                ),
              const SizedBox(
              height: 10,
               ),
               Container(
                height: 200,
                width: 200,
                alignment: Alignment.bottomLeft,
                decoration:const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors:[
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(255, 173, 39, 83),
                  ]
                ),
              ),
               ),

              ]
            ),
          )

          
        ,
    ),
    )
    );
  }
}
