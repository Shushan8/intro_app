import 'package:flutter/material.dart';
import 'package:intro_app/screens/home_screen.dart';
import 'package:intro_app/screens/intro_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = (prefs.getBool('seen') ?? false);
  runApp(MyApp(seen: seen));
}

class MyApp extends StatelessWidget {
  final bool seen;

  const MyApp({super.key, required this.seen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: seen ? IntroScreen() : const HomeScreen() 
    );
  }
}