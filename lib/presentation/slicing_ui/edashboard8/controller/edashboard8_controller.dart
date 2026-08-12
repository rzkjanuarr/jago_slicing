import 'package:get/get.dart';

class Edashboard8Controller extends GetxController {
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

  List<Map<String, dynamic>> dataNews = [
    {
      "date": "12 Aug 2026",
      "title": "Global Markets Continue to Rise",
      "subtitle":
          "Investors remain optimistic as major markets show positive growth.",
    },
    {
      "date": "11 Aug 2026",
      "title": "Technology Sector Sees Strong Growth",
      "subtitle":
          "New innovations are driving significant changes across the technology industry.",
    },
    {
      "date": "10 Aug 2026",
      "title": "New Economic Policy Announced",
      "subtitle":
          "The government introduces a new strategy to support economic development.",
    },
    {
      "date": "9 Aug 2026",
      "title": "Digital Economy Expands Rapidly",
      "subtitle":
          "Businesses are increasingly adopting digital solutions to reach more customers.",
    },
    {
      "date": "8 Aug 2026",
      "title": "Investors Watch Currency Markets",
      "subtitle":
          "Currency movements remain a key focus for investors around the world.",
    },
    {
      "date": "7 Aug 2026",
      "title": "Business Confidence Improves",
      "subtitle":
          "Companies report stronger confidence as consumer demand continues to increase.",
    },
    {
      "date": "6 Aug 2026",
      "title": "Artificial Intelligence Changes Industries",
      "subtitle":
          "AI adoption continues to transform the way businesses operate and compete.",
    },
    {
      "date": "5 Aug 2026",
      "title": "Global Trade Faces New Challenges",
      "subtitle":
          "International businesses prepare for potential changes in global trade policies.",
    },
    {
      "date": "4 Aug 2026",
      "title": "Startup Investments Reach New High",
      "subtitle":
          "Investors are showing renewed interest in promising technology startups.",
    },
    {
      "date": "3 Aug 2026",
      "title": "Future of Digital Finance",
      "subtitle":
          "Financial technology continues to create new opportunities for consumers and businesses.",
    },
  ];
}
