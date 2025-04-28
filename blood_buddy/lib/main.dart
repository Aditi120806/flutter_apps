import 'package:blood_buddy/splashScreen1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MainApp());
  WidgetsFlutterBinding.ensureInitialized();
  
 await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyC5sRy30wv1cd1TfX66umudKrck94y3ahs",
      authDomain: "aditi-5ea63.firebaseapp.com",
      projectId: "aditi-5ea63",
      storageBucket: "aditi-5ea63.appspot.com", // fixed typo
      messagingSenderId: "380693671048",
      appId: "1:380693671048:web:eac3406f7af97fa24f833d",
      
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: SplashScreen1());
  }
}
