import 'package:flutter/material.dart';
import 'package:wallpaper/splash_screen.dart';
import 'package:wallpaper/userscredentials/sign_in.dart';
import 'package:wallpaper/userscredentials/sign_up.dart';
import 'wallpaper-app/ui/wallpaper.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/wallpaper': (context) => const Wallpaper(),
        '/signin': (context) => const SignIn(),
        '/signup' : (context) => const SignUp()
      },
    );
  }
}
