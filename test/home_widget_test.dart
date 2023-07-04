import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/src/data/model/image_model.dart';
import 'package:demo/src/presentation/controllers/home_controller.dart';
import 'package:demo/src/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  late HomeController homeController;

  setUp(() {
    Get.testMode = true;
    homeController = Get.put(HomeController());
    ImageModel imageModel = ImageModel(
      description: 'descrption',
      altDescription: 'altDescription',
      urls: Urls(
          raw:
              'https://images.unsplash.com/photo-1688261433834-8ae224ef3416?ixid=M3wyODA3OTZ8MHwxfGFsbHwyOXx8fHx8fDJ8fDE2ODg0NTU2MjB8&ixlib=rb-4.0.3',
          thumb:
              'https://images.unsplash.com/photo-1688261433834-8ae224ef3416?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wyODA3OTZ8MHwxfGFsbHwyOXx8fHx8fDJ8fDE2ODg0NTU2MjB8&ixlib=rb-4.0.3&q=80&w=200'),
    );

    homeController.imageList.add(imageModel);
  });
  testWidgets('HomeScreen displays image grid', (WidgetTester tester) async {
    // Build the HomeScreen widget
    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(),
      ),
    );

    // Verify the presence of the app bar title
    expect(find.text('Image Grid'), findsOneWidget);
    await tester.pump();

    // Verify the updated state of the image grid
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(CachedNetworkImage),
        findsNWidgets(homeController.imageList.length));

    // Perform a tap on one of the images
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pump();
  });
}
