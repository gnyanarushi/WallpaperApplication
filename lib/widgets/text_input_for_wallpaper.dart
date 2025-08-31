import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TextInputForWallpaper extends StatefulWidget {
  final bool isPassword;
  final String label;

  const TextInputForWallpaper({
    super.key,
    required this.isPassword,
    required this.label,
  });

  @override
  State<TextInputForWallpaper> createState() => _TextInputForWallpaperState();
}

class _TextInputForWallpaperState extends State<TextInputForWallpaper> {
  late bool _isPasswordHidden;

  @override
  void initState() {
    super.initState();
    _isPasswordHidden = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _isPasswordHidden,
      decoration: InputDecoration(
        label: Text(widget.label, style: TextStyle(fontSize: 15)),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        suffixIcon:
            widget.isPassword
                ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _isPasswordHidden = !_isPasswordHidden;
                    });
                  },
                  child:
                      _isPasswordHidden
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility_outlined),
                )
                : null,
      ),
    );
  }
}
