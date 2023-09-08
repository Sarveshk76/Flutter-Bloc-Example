import 'package:flutter/material.dart';
import '../CartScreen/screen.dart';
import '../homeScreen/screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'OrderUp',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
        routes: Map.fromIterables(
          [
            '/home',
            '/cart',
          ],
          [
            (context) => const HomeScreen(),
            (context) => const CartScreen(),
          ],
        ));
  }
}
