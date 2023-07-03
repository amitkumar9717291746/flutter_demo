import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      getPages: Routes.routes,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
