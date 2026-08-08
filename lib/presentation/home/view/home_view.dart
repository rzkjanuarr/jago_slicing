import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jago_slicing/core.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }

      if (controller.hasError.value) {
        return Scaffold(
          body: Center(child: Text("Error: ${controller.errorMessage.value}")),
        );
      }

      return Scaffold(
        appBar: AppBar(title: const Text("Home"), actions: const []),
        body: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: controller.menus.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final menu = controller.menus[index];
            return ListTile(
              leading: CircleAvatar(child: Text("${index + 1}")),
              title: Text(menu["title"]),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Get.to(() => menu["page"] as Widget),
            );
          },
        ),
      );
    });
  }
}
