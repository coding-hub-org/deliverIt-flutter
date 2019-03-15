import 'package:deliverit/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(DeliverIt());

class DeliverIt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliverIt',
      theme: _buildTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
      },
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
        buttonTheme: ButtonThemeData(
            buttonColor: Color(0xFF17B0C3),
            splashColor: Color(0xFF54d5e5),
            disabledColor: Color(0xFF17B0C3)),
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(fontSize: 16, color: Color(0xFF17B0C3)),
            hintStyle: TextStyle(fontSize: 16, color: Colors.black87),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFD4D4D4)),
                borderRadius: BorderRadius.circular(10)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFD4D4D4)),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF17B0C3)),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFD4D4D4)),
                borderRadius: BorderRadius.circular(10))));
  }
}
