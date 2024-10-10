import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          title: const Text("seventh",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black
          ),),
          centerTitle: true,
          backgroundColor: Colors.blue,),
          body:  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                height: 200,
                width: 200,
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkF8dc5Huhb3LPZhiMnnoJYbnaO97FZIlb-A&s"),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                height: 200,
                width: 200,
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkF8dc5Huhb3LPZhiMnnoJYbnaO97FZIlb-A&s"),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                height: 200,
                width: 200,
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkF8dc5Huhb3LPZhiMnnoJYbnaO97FZIlb-A&s"),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                height: 200,
                width: 200,
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkF8dc5Huhb3LPZhiMnnoJYbnaO97FZIlb-A&s"),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                height: 200,
                width: 200,
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkF8dc5Huhb3LPZhiMnnoJYbnaO97FZIlb-A&s"),
                )
              ],
            ),
            ),
      ),
      
    );
  }
}
