import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jago_slicing/core.dart';

class Edashboard3View extends StatelessWidget {
  const Edashboard3View({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Edashboard3Controller());

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<Edashboard3Controller>(
          builder: (controller) {
            // kondisi loading
            if (controller.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            // kondisi error
            if (controller.hasError) {
              return Center(child: Text("Error: ${controller.errorMessage}"));
            }

            // tampilan utama
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: []),
            );
          },
        ),
      ),
    );
  }
}
