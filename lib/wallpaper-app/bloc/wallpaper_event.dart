part of 'wallpaper_bloc.dart';

@immutable
abstract class WallpaperEvent {}

class WallpaperInitialFetchEvent extends WallpaperEvent {}

class WallpaperLoadMoreClickEvent extends WallpaperEvent {}

class SetWallpaperToHomeScreenEvent extends WallpaperEvent {
  final String imageurl;

  SetWallpaperToHomeScreenEvent({required this.imageurl});
}
 