import 'package:flutter/material.dart';
import 'package:funrecipe/funrecipe_theme.dart';
import 'package:funrecipe/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = FunrecipeTheme.dark();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Funrecipe',
      theme: theme,
      home: const Home()
      
    );
  }
}

