import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test_interview/data/api/ApiService.dart';
import 'package:flutter_test_interview/data/model/television.dart';
import 'package:flutter_test_interview/ui/detail_screen.dart';
import 'package:flutter_test_interview/ui/home_screen.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Television',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
