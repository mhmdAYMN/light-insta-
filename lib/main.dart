import 'package:flutter/material.dart';
import 'package:instgram/login.dart';
import 'package:instgram/sing.dart';
import 'home.dart';
import 'new_add.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),

        initialRoute: 'login',
        routes: {
          'login':(context) => LOGIN(),
          'home': (context) => HOME(),
          'add':(context) => NEW_ADD(),
          'sign':(context) => signup(),
          //'REG':(context) => screen2(),
        }


        ) ;



  }




}
