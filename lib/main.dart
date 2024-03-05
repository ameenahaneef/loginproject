import 'package:flutter/material.dart';
import 'package:loginproject/screens/splash.dart';
const SAVE_KEY_NAME='UserLoggedIn';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Sample',
      theme:ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: ScreenSplash(),
      
    );
  }
}