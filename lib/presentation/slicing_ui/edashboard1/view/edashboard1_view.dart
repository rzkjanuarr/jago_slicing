import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jago_slicing/core.dart';

class Edashboard1View extends StatelessWidget {
  const Edashboard1View({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Edashboard1Controller());

    return Scaffold(
      // backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: GetBuilder<Edashboard1Controller>(
          builder: (controller) {
            // Kondisi Loading
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // Kondisi Error
            if (controller.hasError) {
              return Center(child: Text("Error: ${controller.errorMessage}"));
            }

            // Tampilan Utama
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shop",
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "over 45k items, available for you!",
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey[500],
                        child: Icon(Icons.person, color: Colors.grey[900]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Builder(
                    builder: (context) {
                      List images = [
                        "https://images.unsplash.com/photo-1542744173-8e7e53415bb0?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        "https://plus.unsplash.com/premium_photo-1661775434014-9c0e8d71de03?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        "https://images.unsplash.com/photo-1564069114553-7215e1ff1890?q=80&w=1632&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        "https://plus.unsplash.com/premium_photo-1677529494239-682591edd525?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        "https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      ];

                      return Column(
                        children: [
                          CarouselSlider(
                            carouselController:
                                controller.carouselSliderController,
                            options: CarouselOptions(
                              height: 160.0,
                              autoPlay: true,
                              enlargeCenterPage: false,
                              viewportFraction: 1.0,
                              onPageChanged: (index, reason) {
                                controller.changeIndex(index);
                              },
                            ),
                            items: images.map((imageUrl) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(0.0),
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(imageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: images.asMap().entries.map((entry) {
                              bool isSelected =
                                  controller.currentIndex == entry.key;
                              return GestureDetector(
                                onTap: () => controller.carouselSliderController
                                    .animateToPage(entry.key),
                                child: Container(
                                  width: isSelected ? 40 : 6.0,
                                  height: 6.0,
                                  margin: const EdgeInsets.only(
                                    right: 6.0,
                                    top: 12.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.green
                                        : Colors.grey.withAlpha(60),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "New Arrival",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "See all >",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.0 / 1.4,
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                    itemCount: controller.products.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var item = controller.products[index];
                      return Container(
                        child: Column(
                          children: [
                            Container(
                              height: 160.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(item["photo"]),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(0.0),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              item["product_name"],
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              item["category"],
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
