import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:teste_flutter/app/view/auth_page.dart';
import 'package:teste_flutter/firebase_options.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth & Google AdSense',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthPage(),
    );
  }
}