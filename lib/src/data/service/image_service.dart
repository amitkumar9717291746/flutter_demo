


import 'package:demo/src/data/service/serviceImpl/image_service_impl.dart';

import '../model/image_model.dart';


mixin ImageService {

  static final ImageService instance = ImageServiceImpl();


  Future<List<ImageModel>> fetchData(int pageNo, int perPage) async {
    throw UnimplementedError('Fetch Image not implemented');
  }


}