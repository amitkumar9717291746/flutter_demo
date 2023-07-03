


import 'dart:convert';
import 'package:demo/src/utils/network_service.dart';
import '../../model/image_model.dart';
import '../image_service.dart';

class ImageServiceImpl with ImageService {


  @override
  Future<List<ImageModel>> fetchData(int pageNo, int perPage) async {
    String url = '${NetworkService.url}?page=$pageNo&per_page=$perPage&client_id=${NetworkService.token}';
    var response = await NetworkService.getResponse(url);
    List<ImageModel> list = ImageModel.addDataList(json.decode(response.toString()));
    return list;
  }

}