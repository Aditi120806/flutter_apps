import 'package:flutter/material.dart';

void main()
{
  runApp(const Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      home:Scaffold(
      appBar: AppBar(
        title:const  Text("Axis Alignment",
        style: TextStyle(
          fontWeight: FontWeight.w500
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                width: 150,
                color: Colors.amber,
              ),
              Container(
                height: 150,
                width: 150,
                color: Colors.blueAccent,
              )
            ],
        ),

      )
    );
    
  }
}