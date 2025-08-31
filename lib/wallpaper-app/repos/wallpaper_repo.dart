import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:wallpaper/wallpaper-app/models/wallpaper_ui_model.dart';

class WallpaperRepo {
  
  List images = [];


  static Future<List<WallpaperUiModel>> fetchapi(int page) async {
    String url = "https://api.pexels.com/v1/curated?per_page=80&page=${page.toString()}";
    List<WallpaperUiModel> wallpapers = [];
    try{
      await http
        .get(
          Uri.parse(url),
          headers: {
            'Authorization':
                '2FECs2EcuHZThIYuy4R0ZWbLhyZiZu3LZBbw1tYncDCVobA6j1WRtN6q',
          },
        )
          .then((value) {
            Map result = jsonDecode(value.body);
            List photos = result['photos'];
             for( int i = 0 ; i < photos.length ; i++){
              WallpaperUiModel wallpaperUiModel = WallpaperUiModel.fromMap(photos[i]);
              wallpapers.add(wallpaperUiModel);
             }
            
          });
        return wallpapers;
    }
    catch(e){
      log(e.toString());
      return [];
    }
  }
}
