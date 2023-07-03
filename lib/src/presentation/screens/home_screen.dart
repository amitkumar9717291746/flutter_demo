import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/src/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/image_model.dart';
import '../../utils/routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Grid')),
      body: Obx(() {
        return NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollEndNotification &&
                scrollNotification.metrics.extentAfter == 0) {
              homeController.fetchData();
              return true;
            }
            return false;
          },
          child: GridView.builder(
            itemCount: homeController.imageList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemBuilder: (BuildContext context, int index) {
              ImageModel imageModel = homeController.imageList[index];
              if (index < homeController.imageList.length) {
                return GestureDetector(
                  onTap: () =>
                      Get.toNamed(Routes.details, arguments: imageModel),
                  child: CachedNetworkImage(
                    imageUrl: imageModel.urls!.thumb!,
                    placeholder: (context, url) => const Icon(Icons.photo),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
