import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/wallpaper-app/bloc/wallpaper_bloc.dart';

class FullScreen extends StatefulWidget {
  final String imageurl;
  const FullScreen({super.key, required this.imageurl});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  WallpaperBloc wallpaperBloc = WallpaperBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WallpaperBloc, WallpaperState>(
      
      bloc: wallpaperBloc,
      
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Container(
                  child: Image.network(widget.imageurl, fit: BoxFit.cover),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  color: Colors.black,
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Set Wallpaper",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
