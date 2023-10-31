import 'package:flutter/material.dart';
import 'package:news_app/UI/Home/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: 'Exo',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            )
          )
        ),
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF39A552),
        primary: const Color(0xFF39A552),
        ),
        useMaterial3: true,
      ),
      routes: {
        HomeScreen.routeName :(_) => const HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}


