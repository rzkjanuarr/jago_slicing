import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jago_slicing/core.dart';

class Edashboard6View extends StatelessWidget {
  const Edashboard6View({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Edashboard6Controller());

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<Edashboard6Controller>(
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
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.grey[900]!),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.blueGrey[900],
                      ),
                      suffixIcon: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.sort, color: Colors.blueGrey[900]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        "What's new Andrew?",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Spacer(),
                      CircleAvatar(
                        radius: 16.0,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.image, color: Colors.white, size: 14),
                      ),
                      const SizedBox(width: 5.0),
                      CircleAvatar(
                        radius: 16.0,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.video_call,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      CircleAvatar(
                        radius: 16.0,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.location_city,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),

                  ListView.builder(
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
                          // border: Border.all(width: 1, color: Colors.red),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(),
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(item["photo"]),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            item["name"],
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          const SizedBox(width: 5.0),
                                          const Icon(
                                            Icons.location_city,
                                            size: 24.0,
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text(
                                            item["location"],
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "${item["minute"].toString()} minute ago",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.more_horiz, size: 24.0),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["textComment"],
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Container(
                                  height: 300,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              item["imageRandom"],
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 300,
                                        width: MediaQuery.of(
                                          context,
                                        ).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withAlpha(60),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 16.0,
                                      backgroundColor: Colors.grey,
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                    ),
                                    const SizedBox(width: 5.0),
                                    Text(
                                      "${item["nameHumanLike"]} and 3 others have ben here",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10.0),
                                Divider(),
                                const SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.favorite, size: 24.0),
                                        const SizedBox(width: 5.0),
                                        Text(
                                          item["likes"].toString(),
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 10.0),
                                    Row(
                                      children: [
                                        const Icon(Icons.message, size: 24.0),
                                        const SizedBox(width: 5.0),
                                        Text(
                                          item["comment"].toString(),
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 10.0),
                                    Row(
                                      children: [
                                        const Icon(Icons.share, size: 24.0),
                                        const SizedBox(width: 5.0),
                                        Text(
                                          "1",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
