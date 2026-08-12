import 'package:get/get.dart';

class Edashboard7Controller extends GetxController {
  bool isLoading = false;
  bool hasError = false;
  String errorMessage = "";
  int counter = 0;

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  Future<void> initializeData() async {
    isLoading = true;
    update();
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      isLoading = false;
      hasError = false;
    } catch (e) {
      isLoading = false;
      hasError = true;
      errorMessage = e.toString();
    }
    update();
  }

  void increment() {
    counter++;
  }

  void decrement() {
    counter--;
  }

  List<Map<String, dynamic>> newsPaperData = [
    {
      "image": "https://images.unsplash.com/photo-1504711434969-e33886168f5c",
      "title": "Easy-to-Win Trade War Costs Taxpayers Money",
      "date": "12 Aug 2026",
    },
    {
      "image": "https://images.unsplash.com/photo-1495020689067-958852a7765e",
      "title": "Global Markets React to New Economic Policies",
      "date": "11 Aug 2026",
    },
    {
      "image": "https://images.unsplash.com/photo-1585829365295-ab7cd400c167",
      "title": "Technology Sector Leads Market Growth",
      "date": "10 Aug 2026",
    },
    {
      "image": "https://images.unsplash.com/photo-1521295121783-8a321d551ad2",
      "title": "New Developments Shape the Future of Business",
      "date": "9 Aug 2026",
    },
    {
      "image": "https://images.unsplash.com/photo-1505373877841-8d25f7d46678",
      "title": "World Leaders Gather for Economic Summit",
      "date": "8 Aug 2026",
    },
    {
      "image": "https://images.unsplash.com/photo-1495020689067-958852a7765e",
      "title": "Local Businesses Prepare for Major Changes",
      "date": "7 Aug 2026",
    },
    {
      "image": "https://images.unsplash.com/photo-1504711331083-9c3b8e4e7f14",
      "title": "Innovation Continues to Transform Daily Life",
      "date": "6 Aug 2026",
    },
    {
      "image": "https://images.unsplash.com/photo-1559526324-593bc073d938",
      "title": "Investors Watch Currency Markets Closely",
      "date": "5 Aug 2026",
    },
    {
      "image": "https://images.unsplash.com/photo-1529107386315-e1a2ed48a620",
      "title": "Government Announces New Economic Strategy",
      "date": "4 Aug 2026",
    },
    {
      "image": "https://images.unsplash.com/photo-1504384308090-c894fdcc538d",
      "title": "Digital Economy Expected to Grow Rapidly",
      "date": "3 Aug 2026",
    },
  ];
}
