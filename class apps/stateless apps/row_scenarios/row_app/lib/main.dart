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
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.lightBlue,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
              height: 200,
              width: 200,
              color: Colors.amber,
              )
            ],
          ),
        ),

      )
    );
    
  }
}