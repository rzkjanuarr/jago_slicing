import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jago_slicing/core.dart';

class Edashboard8View extends StatelessWidget {
  const Edashboard8View({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Edashboard8Controller());

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<Edashboard8Controller>(
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/128/214/214490.png",
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          "Auto News",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Stack(
                    children: [
                      Container(
                        height: 200.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=1200&auto=format&fit=crop",
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      Container(
                        height: 200.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(60),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      Positioned(
                        right: 20,
                        top: 20,
                        child: CircleAvatar(
                          radius: 16.0,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.more_horiz, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),

                  ListView.builder(
                    itemCount: controller.dataNews.length,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) {
                      var item = controller.dataNews[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          // border: Border.all(width: 1, color: Colors.red),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 16.0,
                                  backgroundColor: Colors.black,
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Text(
                                  item["date"],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Column(
                              children: [
                                Text(
                                  item["title"],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  item["subtitle"],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Divider(),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
