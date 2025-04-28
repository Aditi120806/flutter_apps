import 'package:flutter/material.dart';
class Customsnackbar{
  static showcustomsnackbar(
    {required String message,required BuildContext context}
  )
  {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,style:const TextStyle(fontSize: 18,color: Colors.black)),
 backgroundColor: Colors.white,
    ),);
  }
}