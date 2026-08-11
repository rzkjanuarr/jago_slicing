import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jago_slicing/core.dart';

class Edashboard5View extends StatelessWidget {
  const Edashboard5View({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Edashboard5Controller());

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<Edashboard5Controller>(
          builder: (controller) {
            // kondisi loading
            if (controller.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            //
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
                      Expanded(
                        child: Row(
                          children: [
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/128/214/214490.png",
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              "Bankai Sosial Media",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.add, size: 24.0),
                          const SizedBox(width: 5.0),
                          const Icon(Icons.search, size: 24.0),
                          const SizedBox(width: 5.0),
                          const Icon(Icons.more_horiz, size: 24.0),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),

                  SingleChildScrollView(
                    controller: ScrollController(),
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    child: Row(
                      children: List.generate(controller.userData.length, (
                        index,
                      ) {
                        var item = controller.userData[index];
                        if (index == 0) {
                          return Container(
                            margin: const EdgeInsets.only(right: 12.0),
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.green,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            margin: const EdgeInsets.only(right: 12.0),
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: NetworkImage(
                                item["photo"] ??
                                    CircleAvatar(
                                      radius: 50.0,
                                      backgroundColor: Colors.grey,
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                    ),
                              ),
                            ),
                          );
                        }
                      }),
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  SizedBox(
                    child: ListView.builder(
                      itemCount: controller.userList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      clipBehavior: Clip.none,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var item = controller.userList[index];
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(bottom: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(0.0),
                            ),
                            border: Border.all(width: 1, color: Colors.red),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      item["photo"],
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item["name"],
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "${item["minute"]} a minute ago",
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            const SizedBox(width: 10.0),
                                            const Icon(
                                              Icons.location_on,
                                              size: 24.0,
                                            ),
                                            Text(
                                              item["location"],
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(Icons.more_horiz, size: 24.0),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                  // border: Border.all(width: 2, color: Colors.blue),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 200.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            item["imageRandom"],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withAlpha(60),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Positioned(
                                        left: 20,
                                        bottom: 20,
                                        child: Text(
                                          item["textComment"],
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.favorite,
                                          size: 24.0,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(width: 10.0),
                                        const Icon(
                                          Icons.message,
                                          size: 24.0,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(width: 10.0),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.share,
                                    size: 24.0,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              Divider(),
                              const SizedBox(height: 10.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          "${item["likes"]} likes",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        Text(
                                          "${item["comment"]} comments"
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "8 shared!",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
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
