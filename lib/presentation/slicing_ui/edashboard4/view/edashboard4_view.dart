import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jago_slicing/core.dart';

class Edashboard4View extends StatelessWidget {
  const Edashboard4View({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Edashboard4Controller());

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<Edashboard4Controller>(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Text(
                      "Instagram Clone",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.blueGrey[900],
                      ),
                    ),
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
                            height: 160,
                            width: 120,
                            margin: const EdgeInsets.only(right: 12.0),

                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Spacer(),
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    child: Icon(Icons.add, color: Colors.white),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    "Add Story",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            height: 160,
                            width: 120,
                            margin: const EdgeInsets.only(right: 12.0),

                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Spacer(),
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      item["photo"],
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    item["name"],
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
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
                      padding: EdgeInsets.zero,
                      clipBehavior: Clip.none,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var item = controller.userList[index];
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(bottom: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(width: 1, color: Colors.red),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            item["photo"],
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        Text(
                                          item["name"],
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        CircleAvatar(
                                          radius: 12.0,
                                          backgroundColor: Colors.green,
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Text(
                                    "${item["minute"].toString()} minute a ago",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  const Icon(Icons.more_horiz, size: 20.0),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                item["textComment"],
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          "${item["likes"].toString()} Likes",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        Text(
                                          "${item["comment"].toString()} Comments",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20.0,
                                        backgroundColor: Colors.grey[300],
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      CircleAvatar(
                                        radius: 20.0,
                                        backgroundColor: Colors.grey[300],
                                        child: Icon(
                                          Icons.message,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      CircleAvatar(
                                        radius: 20.0,
                                        backgroundColor: Colors.grey[300],
                                        child: Icon(
                                          Icons.share,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                      ),
                                    ],
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
