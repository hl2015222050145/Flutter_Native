import 'package:flutter/material.dart';
import 'Login/UI/LoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '登陆',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        "/login":(BuildContext context) => new LoginPage(),
      },
      home: LoginPage(),
    );
  }
}