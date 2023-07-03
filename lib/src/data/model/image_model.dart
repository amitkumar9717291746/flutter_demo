import 'package:flutter/material.dart';

class ImageModel {
  final String? description;
  final String? altDescription;
  final Urls? urls;

  ImageModel({this.description, this.altDescription, this.urls});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      description: json['description'].toString(),
      altDescription: json['alt_description'].toString(),
      urls: Urls.fromJson(json['urls']),
    );
  }


  static List<ImageModel> addDataList(json) {
    var list = json as List;
    try {
      List<ImageModel> listData =
      list.map((data) => ImageModel.fromJson(data)).toList();
      return listData;
    } catch (e) {
      debugPrint(e.toString());
    }
    return [ImageModel()];
  }

}

class Urls {
  final String? raw, thumb;

  Urls({this.raw, this.thumb});

  factory Urls.fromJson(Map<String, dynamic> json) {
    return Urls(
      raw: json['raw'].toString(),
      thumb: json['thumb'].toString(),
    );
  }
}
