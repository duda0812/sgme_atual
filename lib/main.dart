import 'package:flutter/material.dart';
import 'package:projeto/home.dart';
import 'telaInicial.dart';
import 'login.dart';


void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Telainicial(),
    );
  }
}



