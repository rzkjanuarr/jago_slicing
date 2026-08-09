import 'package:get/get.dart';

class Edashboard3Controller extends GetxController {
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
}
