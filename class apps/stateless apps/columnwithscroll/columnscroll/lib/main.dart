import 'package:flutter/material.dart';
 void main()
 {
  runApp(const Myapp());
 }
  class Myapp extends StatelessWidget{
  const Myapp({super.key});
  @override
  Widget build(BuildContext context ){
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
         title: const  Text("column with scroll",
         style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: 20
         ),),
         centerTitle: true,
         backgroundColor: Colors.deepPurpleAccent,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbISPlbu2bk8HyJqM1QQ4XiUMRUfj_WpRRGA&s"),
                Container(
                  width: 200,
                  height:200,
                  color:Colors.blueAccent,
                ),
                              Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbISPlbu2bk8HyJqM1QQ4XiUMRUfj_WpRRGA&s"),
                Container(
                  width: 200,
                  height:200,
                  color:Colors.blueAccent,
                ),
                              Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbISPlbu2bk8HyJqM1QQ4XiUMRUfj_WpRRGA&s"),
                Container(
                  width: 200,
                  height:200,
                  color:Colors.blueAccent,
                )
              ],
            ),
          ),
        )
        ,),
    );
  }
 }