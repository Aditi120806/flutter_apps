import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black12,
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
       body:
       ListView.builder(
            itemCount: 5,
            itemBuilder:(BuildContext context,int index){
               return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  const Text("Action Movies",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white
                  ),),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 300,
                          width: 200,
                          decoration: const  BoxDecoration(
                            color: Color.fromARGB(255, 157, 7, 7)
                          ),
                          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS22HBj7OypavCCDYIaALZFYDrGqCDGJxpN4A&s")
                    ),
                    Container(
                          padding: const EdgeInsets.all(3),
                          height: 300,
                          width: 200,
                          decoration: const  BoxDecoration(
                            color: Color.fromARGB(255, 157, 7, 7)
                          ),
                          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRe8lYjYaLGJpbErEQfC0M86EFEX-qCuZrUew&s")
                    ),
                    Container(
                          padding: const EdgeInsets.all(3),
                          height: 300,
                          width: 200,
                          decoration: const  BoxDecoration(
                            color: Color.fromARGB(255, 157, 7, 7)
                          ),
                          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlehMZkIfQaLhGlweyMXNTlRP7JkD9o30b6Q&s")
                    ),
                    Container(
                          padding: const EdgeInsets.all(3),
                          height: 300,
                          width: 200,
                          decoration: const  BoxDecoration(
                            color: Color.fromARGB(255, 157, 7, 7)
                          ),
                          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZC6Sky1OhpfJWciD0wr9rwEJQJqCa9I5RyA&s")
                    ),
                     Container(
                          padding: const EdgeInsets.all(3),
                          height: 300,
                          width: 200,
                          decoration: const  BoxDecoration(
                            color: Color.fromARGB(255, 157, 7, 7)
                          ),
                          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS22HBj7OypavCCDYIaALZFYDrGqCDGJxpN4A&s")
                    ),
                    Container(
                          padding: const EdgeInsets.all(3),
                          height: 300,
                          width: 200,
                          decoration: const  BoxDecoration(
                            color: Color.fromARGB(255, 157, 7, 7)
                          ),
                          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRe8lYjYaLGJpbErEQfC0M86EFEX-qCuZrUew&s")
                    ),
                    Container(
                          padding: const EdgeInsets.all(3),
                          height: 300,
                          width: 200,
                          decoration: const  BoxDecoration(
                            color: Color.fromARGB(255, 157, 7, 7)
                          ),
                          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZC6Sky1OhpfJWciD0wr9rwEJQJqCa9I5RyA&s")
                    ),
                    ],
                    ),
                  )
           
                ]
               );
              
            },
                   ),
         ),
    );
      
    
  }
}
