import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_home/goldapp.dart';
void main() {
  runApp(goldapp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        debugShowCheckedModeBanner: false,
      home: goldapp(),
    );
  }
}
