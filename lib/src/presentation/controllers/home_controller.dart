import 'dart:convert';

import 'package:demo/src/data/repositories/image_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/image_model.dart';

class HomeController extends GetxController {

  RxList imageList = <ImageModel>[].obs;
  static const pageSize = 30;
  int pageNo = 1;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }


  void fetchData() async {
    imageList.addAll(await ImageRepository.fetchData(pageNo, pageSize));
    pageNo++;
  }


}