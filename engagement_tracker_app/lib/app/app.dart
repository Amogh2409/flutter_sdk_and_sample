// lib/app/app.dart
import 'package:flutter/material.dart';
import 'routes.dart';

class PampersClubApp extends StatelessWidget {
  const PampersClubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pampers Club',
      theme: ThemeData(
        primaryColor: const Color(0xFF0066CC),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF0066CC),
          secondary: Color(0xFFFFD700),
        ),
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontFamily: 'Roboto',
          ),
          iconTheme: const IconThemeData(color: Color(0xFF0066CC)),
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.grey[800]),
          displayMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey[800]),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.grey[700]),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.grey[600]),
          labelLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: EdgeInsets.zero,
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}