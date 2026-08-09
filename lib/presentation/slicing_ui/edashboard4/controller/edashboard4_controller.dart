import 'package:get/get.dart';

class Edashboard4Controller extends GetxController {
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

  List userData = [
    {
      "name": "Jessica",
      "photo":
          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "name": "Tammara",
      "photo":
          "https://plus.unsplash.com/premium_photo-1671656333460-793292581bc6?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "name": "Lidia",
      "photo":
          "https://images.unsplash.com/photo-1601412436009-d964bd02edbc?q=80&w=928&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "name": "Adila",
      "photo":
          "https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?q=80&w=928&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "name": "Nike",
      "photo":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
  ];

  List<Map<String, dynamic>> userList = [
    {
      "name": "Jessica",
      "photo":
          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWd8fHx8fA%3D%3D",
      "likes": 124,
      "comment": 18,
      "minute": 5,
      "textComment": "This place looks absolutely amazing! 😍",
    },
    {
      "name": "Tammara",
      "photo":
          "https://plus.unsplash.com/premium_photo-1671656333460-793292581bc6?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWd8fHx8fA%3D%3D",
      "likes": 87,
      "comment": 12,
      "minute": 12,
      "textComment": "Love this photo! The vibes are perfect ✨",
    },
    {
      "name": "Lidia",
      "photo":
          "https://images.unsplash.com/photo-1601412436009-d964bd02edbc?q=80&w=928&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWd8fHx8fA%3D%3D",
      "likes": 243,
      "comment": 31,
      "minute": 18,
      "textComment": "Okay, this is definitely one of my favorites! ❤️",
    },
    {
      "name": "Adila",
      "photo":
          "https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?q=80&w=928&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWd8fHx8fA%3D%3D",
      "likes": 56,
      "comment": 7,
      "minute": 24,
      "textComment": "Such a beautiful moment! 🥰",
    },
    {
      "name": "Nike",
      "photo":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWd8fHx8fA%3D%3D",
      "likes": 315,
      "comment": 42,
      "minute": 31,
      "textComment": "You always know how to make a great post 🔥",
    },
    {
      "name": "Sophia",
      "photo":
          "https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWd8fHx8fA%3D%3D",
      "likes": 178,
      "comment": 23,
      "minute": 37,
      "textComment": "Where is this? I really want to visit! 😍",
    },
    {
      "name": "Amanda",
      "photo":
          "https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWd8fHx8fA%3D%3D",
      "likes": 92,
      "comment": 15,
      "minute": 43,
      "textComment": "Looking great! Hope you had a wonderful day 😊",
    },
    {
      "name": "Olivia",
      "photo":
          "https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWd8fHx8fA%3D%3D",
      "likes": 421,
      "comment": 56,
      "minute": 51,
      "textComment": "This deserves way more likes! 🔥🔥",
    },
    {
      "name": "Mia",
      "photo":
          "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWd8fHx8fA%3D%3D",
      "likes": 267,
      "comment": 34,
      "minute": 58,
      "textComment": "Absolutely beautiful! Can't stop looking at this ❤️",
    },
    {
      "name": "Emma",
      "photo":
          "https://images.unsplash.com/photo-1551836022-d5d88e9218df?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWd8fHx8fA%3D%3D",
      "likes": 134,
      "comment": 19,
      "minute": 65,
      "textComment": "Such a nice post! Thanks for sharing this 💕",
    },
  ];
}
