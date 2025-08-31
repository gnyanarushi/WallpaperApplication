part of 'wallpaper_bloc.dart';

@immutable
abstract class WallpaperState {}

abstract class WallpaperActionState extends WallpaperState{}

class WallpaperInitial extends WallpaperState {}
class WallpaperFetchLoadingState extends WallpaperState{}
class WallpaperFetchLoadingSuccessState extends WallpaperState{
  final List<WallpaperUiModel> wallpapers; 

  WallpaperFetchLoadingSuccessState({required this.wallpapers});
}
class WallpaperFetchLoadingErrorState extends WallpaperState{}
 
class WallpapersLoadingMoreState extends WallpaperState {} 

class SetWallpaperSetSuccessState extends WallpaperActionState{}