import 'package:elements/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elements/database_helper.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures that binding is initialized
  await DatabaseHelper()
      .database; // Initializes the database before the app starts

  runApp(const ProviderScope(
      child: MyApp())); // Wrap the app in ProviderScope for Riverpod
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atomic Habits Companion',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
