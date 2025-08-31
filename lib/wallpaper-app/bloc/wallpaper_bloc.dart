import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/wallpaper-app/models/wallpaper_ui_model.dart';
import 'package:wallpaper/wallpaper-app/repos/wallpaper_repo.dart';
part 'wallpaper_event.dart';
part 'wallpaper_state.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  WallpaperBloc() : super(WallpaperInitial()) {
    on<WallpaperInitialFetchEvent>(wallpaperInitialFetchEvent);
    on<WallpaperLoadMoreClickEvent>(wallpaperLoadMoreClickEvent); 
    on<SetWallpaperToHomeScreenEvent>(setWallpaperToHomeScreenEvent);
  }

  static int page = 1;
  List<WallpaperUiModel> totalwallpapers = [];

  FutureOr<void> wallpaperInitialFetchEvent(
    WallpaperInitialFetchEvent event,
    Emitter<WallpaperState> emit,
  ) async {
    try {
      Future<List<WallpaperUiModel>> wallpapers = WallpaperRepo.fetchapi(page);
      emit(WallpaperFetchLoadingState());
      log("hello");

      await Future.delayed(Duration(seconds: 3));
      totalwallpapers = await wallpapers;

      emit(WallpaperFetchLoadingSuccessState(wallpapers: totalwallpapers));
    } catch (e) {
      emit(WallpaperFetchLoadingErrorState());
    }
  }

  FutureOr<void> wallpaperLoadMoreClickEvent(
    WallpaperLoadMoreClickEvent event,
    Emitter<WallpaperState> emit,
  ) async {
    page = page + 1;
    Future<List<WallpaperUiModel>> loadedwallpapers = WallpaperRepo.fetchapi(
      page,
    );
    totalwallpapers.addAll(await loadedwallpapers);
    emit(WallpaperFetchLoadingSuccessState(wallpapers: totalwallpapers));
    print(page);
    print(totalwallpapers[140].id);
  }

  FutureOr<void> setWallpaperToHomeScreenEvent(SetWallpaperToHomeScreenEvent event, Emitter<WallpaperState> emit) {
    log(event.imageurl);
  }
}
