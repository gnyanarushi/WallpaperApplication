import 'dart:convert';

class WallpaperUiModel {
  final int id;
  final int height;
  final int width;
  final String photographer;
  final String large;
  final String tiny;

  WallpaperUiModel({
    required this.id,
    required this.height,
    required this.width,
    required this.photographer,
    required this.large,
    required this.tiny,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'height': height,
      'width': width,
      'photographer': photographer,
      'large': large,
      'tiny': tiny,
    };
  }

  factory WallpaperUiModel.fromMap(Map<String, dynamic> map) {
    return WallpaperUiModel(
      id: map['id']?.toInt() ?? 0,
      height: map['height']?.toInt() ?? 0,
      width: map['width']?.toInt() ?? 0,
      photographer: map['photographer'] ?? '',
      large: map['src']['large'] ?? '',
      tiny: map['src'] ['tiny']?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WallpaperUiModel.fromJson(String source) => WallpaperUiModel.fromMap(json.decode(source));
}
