

import 'package:demo/src/data/service/image_service.dart';

import '../model/image_model.dart';


class ImageRepository {

  static Future<List<ImageModel>> fetchData(int pageNo, int perPage) {
    return ImageService.instance.fetchData(pageNo, perPage);
  }


}