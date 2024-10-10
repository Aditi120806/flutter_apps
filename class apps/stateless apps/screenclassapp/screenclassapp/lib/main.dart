import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
       appBar: AppBar(

        title: const Text("shoes",
        style:TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 25,
          color: Colors.purple,
        )),
       ),
       body: Padding(
         padding: const EdgeInsets.all(10.0),
         child: Column(
          children: [
          Image.network("https://app.vectary.com/website_assets/636cc9840038712edca597df/636cc9840038713d9aa59ac2_UV_hero.jpg"),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
               height: 30,
               width: 400,
               child: Text("Nike Air Force 1 :07",
               style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700
               ),),
            ),
            const SizedBox(
              height: 5,
            ),
             Row(
              children: [
               GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5
                  ),
                  decoration:  BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(15),
                    
                  ),
                  child:const  Text("footwear",
                  style:TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  )),
         
                ),
          
               ),
               const SizedBox(
                  width: 20,
               ),
         
               GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:const  Text("shoes",
                  style:TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  )),
                ),
         
               )
              ],
             ),
             const SizedBox(
              height: 15,
             ),
            
            const Text("With iconic style and legendary comfort the AF-1 was made to be worn on repeat.this iteration puts a fresh spin on the hopoclassic with crisp leather ,era-echoing construction and reflective design Swoosh logos.",
               style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black
               ),), const SizedBox(
              height: 15,
             ),
            
             Row(
              children: [
                 const Text("Quantity",
                 style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 17,
                 ),),
                const  SizedBox(
                 width : 10,
             ),
            
                 
                  const SizedBox(
                 width : 10,
             ),
             GestureDetector(
               child:const SizedBox(
            
                child:Icon(Icons.remove),
                
               ),
             ),
             const SizedBox(
                 width : 20,
             ),
              Container(
               padding: const EdgeInsets.all(8.0),
              
              decoration: BoxDecoration(
                border:Border.all(width: 1)
              ),
              child:const  Text("10"),
              
             ),
             const SizedBox(
                 width : 20,
             ),
             GestureDetector(
               child:const SizedBox(
            
                child:Icon(Icons.add),
                
               ),
             ),

              ]
            ),
            const SizedBox(
                 height : 30,
             ),
           
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color:Colors.deepPurple 
                  ),
                  child:const  Center(
                    child: Text("Purchase",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    
                    ),
                    textAlign: TextAlign.center,),
                  ),
                  
                ),
              ),
            )
          ],
          
         ),
       ),
      ),
    );
  }
}
