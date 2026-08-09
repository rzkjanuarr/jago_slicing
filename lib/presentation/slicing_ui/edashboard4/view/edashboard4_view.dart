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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Instagram Clone",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(controller.userData.length, (
                        index,
                      ) {
                        var item = controller.userData[index];
                        if (index == 0) {
                          return Container(
                            height: 160.0,
                            width: 120,
                            margin: const EdgeInsets.only(right: 12.0),
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Spacer(),
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.red,
                                          ),
                                        ),
                                        const SizedBox(height: 7.0),
                                        Text(
                                          "Add Story",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Container(
                            height: 160.0,
                            width: 120,
                            margin: const EdgeInsets.only(right: 12.0),
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Spacer(),
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            item["photo"],
                                          ),
                                        ),
                                        const SizedBox(height: 7.0),
                                        Text(
                                          item["name"],
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
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
                          margin: const EdgeInsets.only(bottom: 20.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(color: Colors.transparent),
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
                                    child: Row(
                                      children: [
                                        Text(
                                          item["name"],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        CircleAvatar(
                                          radius: 12.0,
                                          backgroundColor: Colors.blue,
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "${item["minute"].toString()} minute ago",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  const Icon(
                                    Icons.more_horiz,
                                    size: 24.0,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                item["textComment"] ?? "",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          "${item['likes']} Likes",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        Text(
                                          "${item['comment']} Comments",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 18.0,
                                        backgroundColor: Colors.grey,
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      CircleAvatar(
                                        radius: 18.0,
                                        backgroundColor: Colors.grey,
                                        child: Icon(
                                          Icons.message,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      CircleAvatar(
                                        radius: 18.0,
                                        backgroundColor: Colors.grey,
                                        child: Icon(
                                          Icons.share,
                                          color: Colors.white,
                                          size: 16,
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
