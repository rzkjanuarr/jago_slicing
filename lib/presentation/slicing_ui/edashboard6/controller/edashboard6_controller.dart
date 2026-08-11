import 'package:get/get.dart';

class Edashboard6Controller extends GetxController {
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

  List<Map<String, dynamic>> userList = [
    {
      "name": "Jessica",
      "photo":
          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1740&auto=format&fit=crop",
      "likes": 124,
      "comment": 18,
      "minute": 5,
      "textComment": "This place looks absolutely amazing! 😍",
      "imageRandom":
          "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=1200&auto=format&fit=crop",
      "nameHumanLike": "Sarah",
      "location": "Bali, Indonesia",
    },
    {
      "name": "Tammara",
      "photo":
          "https://plus.unsplash.com/premium_photo-1671656333460-793292581bc6?q=80&w=774&auto=format&fit=crop",
      "likes": 87,
      "comment": 12,
      "minute": 12,
      "textComment": "Love this photo! The vibes are perfect ✨",
      "imageRandom":
          "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?q=80&w=1200&auto=format&fit=crop",
      "nameHumanLike": "Emily",
      "location": "Bandung, Indonesia",
    },
    {
      "name": "Lidia",
      "photo":
          "https://images.unsplash.com/photo-1601412436009-d964bd02edbc?q=80&w=928&auto=format&fit=crop",
      "likes": 243,
      "comment": 31,
      "minute": 18,
      "textComment": "Okay, this is definitely one of my favorites! ❤️",
      "imageRandom":
          "https://images.unsplash.com/photo-1501785888041-af3ef285b470?q=80&w=1200&auto=format&fit=crop",
      "nameHumanLike": "Olivia",
      "location": "Ubud, Bali",
    },
    {
      "name": "Adila",
      "photo":
          "https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?q=80&w=928&auto=format&fit=crop",
      "likes": 56,
      "comment": 7,
      "minute": 24,
      "textComment": "Such a beautiful moment! 🥰",
      "imageRandom":
          "https://images.unsplash.com/photo-1510414842594-a61c69b5ae57?q=80&w=1200&auto=format&fit=crop",
      "nameHumanLike": "Sophia",
      "location": "Jakarta, Indonesia",
    },
    {
      "name": "Nike",
      "photo":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=774&auto=format&fit=crop",
      "likes": 315,
      "comment": 42,
      "minute": 31,
      "textComment": "You always know how to make a great post 🔥",
      "imageRandom":
          "https://images.unsplash.com/photo-1500534623283-312aade485b7?q=80&w=1200&auto=format&fit=crop",
      "nameHumanLike": "Jessica",
      "location": "Yogyakarta, Indonesia",
    },
    {
      "name": "Sophia",
      "photo":
          "https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=774&auto=format&fit=crop",
      "likes": 178,
      "comment": 23,
      "minute": 37,
      "textComment": "Where is this? I really want to visit! 😍",
      "imageRandom":
          "https://images.unsplash.com/photo-1528127269322-539801943592?q=80&w=1200&auto=format&fit=crop",
      "nameHumanLike": "Amanda",
      "location": "Lombok, Indonesia",
    },
    {
      "name": "Amanda",
      "photo":
          "https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?q=80&w=774&auto=format&fit=crop",
      "likes": 92,
      "comment": 15,
      "minute": 43,
      "textComment": "Looking great! Hope you had a wonderful day 😊",
      "imageRandom":
          "https://images.unsplash.com/photo-1493246507139-91e8fad9978e?q=80&w=1200&auto=format&fit=crop",
      "nameHumanLike": "Mia",
      "location": "Malang, Indonesia",
    },
    {
      "name": "Olivia",
      "photo":
          "https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=774&auto=format&fit=crop",
      "likes": 421,
      "comment": 56,
      "minute": 51,
      "textComment": "This deserves way more likes! 🔥🔥",
      "imageRandom":
          "https://images.unsplash.com/photo-1470770841072-f978cf4d019e?q=80&w=1200&auto=format&fit=crop",
      "nameHumanLike": "Emma",
      "location": "Bromo, Indonesia",
    },
    {
      "name": "Mia",
      "photo":
          "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?q=80&w=774&auto=format&fit=crop",
      "likes": 267,
      "comment": 34,
      "minute": 58,
      "textComment": "Absolutely beautiful! Can't stop looking at this ❤️",
      "imageRandom":
          "https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?q=80&w=1200&auto=format&fit=crop",
      "nameHumanLike": "Lidia",
      "location": "Bogor, Indonesia",
    },
    {
      "name": "Emma",
      "photo":
          "https://images.unsplash.com/photo-1551836022-d5d88e9218df?q=80&w=774&auto=format&fit=crop",
      "likes": 134,
      "comment": 19,
      "minute": 65,
      "textComment": "Such a nice post! Thanks for sharing this 💕",
      "imageRandom":
          "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?q=80&w=1200&auto=format&fit=crop",
      "nameHumanLike": "Tammara",
      "location": "Surabaya, Indonesia",
    },
  ];
}
