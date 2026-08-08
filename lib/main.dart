import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jago_slicing/presentation/home/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        title: 'Jago Slicing!',
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
        builder: (context, child) {
          return Stack(
            children: [
              if (child != null) child,
              Positioned(
                right: 20,
                bottom: 20,
                child: Material(
                  color: Colors.red,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      if (Get.key.currentState?.canPop() ?? false) {
                        Get.back();
                      }
                    },
                    child: const SizedBox(
                      width: 32,
                      height: 32,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
