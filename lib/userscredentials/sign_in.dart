import 'package:flutter/material.dart';
import 'package:wallpaper/widgets/text_input_for_wallpaper.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Padding(
          padding: EdgeInsetsGeometry.only(left: 20),
          child: Text(
            "Log in to your Account",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextInputForWallpaper(isPassword: true, label: "User name"),
          ],
        ),
      ),
    );
  }
}
