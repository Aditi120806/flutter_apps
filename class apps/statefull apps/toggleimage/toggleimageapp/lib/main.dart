import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool changeColor = true;

  List imageslist=[ "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShsXDeEAtDQ5515onMCGzmoWzZoyM7kvSa1w&s",
  "https://cf-img-a-in.tosshub.com/sites/visualstory/wp/2024/04/705f38adf8_1714374742-scaled.jpg?size=*:900",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJe55lO0MQ6SAXDXBygeCA-BPb0S9A_y-epDssxmZWVjplFq5rQ2kD_M65gqewvZo9L74&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNZWDcpDtpYT8cVEtV243bnTx1AURImGCtQQ&s"
  ];
  List playerinfo=[
    "Name : Virat Kohli","Name : MS  dhoni","Bumrah","Ravindra Jadeja"
  ];
  int index=0;
  int index2=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Toggle image"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        
        body:Center ( child:Column(
        children: [
        Container(
        height: 250,
        width: 250,
        color: Colors.white,
        child: Image.network(imageslist[index]),
      
       
      ),
      Text(playerinfo[index2],
      style: const TextStyle(fontWeight: FontWeight.w700),)
      ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(index<imageslist.length-1){
            index++;
            index2++;
         
          }else{
            index=0;
            index2=0;
            
          }
          setState(() {
          });
        },
        backgroundColor: Colors.pinkAccent,
        child: const Text("Next"),
        ),
      ),
    );
  }
}
