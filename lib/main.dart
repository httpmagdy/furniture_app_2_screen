import 'package:flutter/material.dart';
import './screens/second-screen.dart';
import './screens/home.dart';
void main() => runApp(FurnitureApp());

class FurnitureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx)=> Home(),
        SecondScreen.routName: (ctx)=> SecondScreen(),
      },
    );
  }
}
