import 'package:flutter/material.dart';
import 'package:realstate_app_ui/screens/welcome_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            // foregroundColor: MaterialStateProperty.all(Colors.white),
            overlayColor: MaterialStateProperty.all(Colors.blueAccent),
            alignment: Alignment.center,
            backgroundColor: MaterialStateProperty.all(Colors.black),
            padding: MaterialStateProperty.all(const EdgeInsets.all(12.0)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
