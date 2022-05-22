import 'package:flutter/material.dart';
import 'package:bijoy_helper/bijoy_helper.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bijoy Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: BijoyText(
              'এই প্যাকেজটি ফ্লাটার ফ্রেমওয়ার্কে বিজয় সমর্থনের জন্য লেখা হয়েছে',
              style: TextStyle(fontFamily: 'SutonyMJ', fontSize: 20.0, height: 1.2),
              toBijoyIf: false,
            ),
          ),
        ),
      ),
    );
  }
}
