import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/wallpaper-app/bloc/wallpaper_bloc.dart';
import 'package:wallpaper/wallpaper-app/ui/full_screen.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class Wallpaper extends StatefulWidget {
  const Wallpaper({super.key});

  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  WallpaperBloc wallpaperBloc = WallpaperBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    wallpaperBloc.add(WallpaperInitialFetchEvent());
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WallpaperBloc, WallpaperState>(
        bloc: wallpaperBloc,
        // ignore: unnecessary_type_check
        buildWhen: (previous, current) => current is WallpaperState,
        // ignore: unnecessary_type_check
        listenWhen: (prevois, current) => current is! WallpaperState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WallpaperFetchLoadingState:
              return Container(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()),
              );
            case WallpaperFetchLoadingSuccessState:
              final loadingSuccessState =
                  state as WallpaperFetchLoadingSuccessState;
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 2,
                            crossAxisCount: 3,
                            childAspectRatio: 2 / 3,
                            mainAxisSpacing: 2,
                          ),
                      itemCount: loadingSuccessState.wallpapers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => FullScreen(
                                      imageurl:
                                          loadingSuccessState
                                              .wallpapers[index]
                                              .large,
                                    ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  loadingSuccessState.wallpapers[index].tiny,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      wallpaperBloc.add(WallpaperLoadMoreClickEvent());
                    },
                    child: Container(
                      color: Colors.black,
                      height: 50,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "Load more",
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
              );
            case WallpaperFetchLoadingErrorState:
              return Container(
                color: Colors.white,
                child: Center(child: Text("Unable to laod the photos")),
              );

            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
