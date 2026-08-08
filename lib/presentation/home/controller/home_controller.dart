import 'package:get/get.dart';
import 'package:jago_slicing/core.dart';

class HomeController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = "".obs;
  final RxInt counter = 0.obs;

  final List<Map<String, dynamic>> menus = [
    {"title": "Edashboard 1", "page": const Edashboard1View()},
    {"title": "Edashboard 2", "page": const Edashboard2View()},
    {"title": "Edashboard 3", "page": const Edashboard3View()},
    {"title": "Edashboard 4", "page": const Edashboard4View()},
    {"title": "Edashboard 5", "page": const Edashboard5View()},
    {"title": "Edashboard 6", "page": const Edashboard6View()},
    {"title": "Edashboard 7", "page": const Edashboard7View()},
    {"title": "Edashboard 8", "page": const Edashboard8View()},
    {"title": "Edashboard 9", "page": const Edashboard9View()},
    {"title": "Edashboard 10", "page": const Edashboard10View()},
  ];

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  Future<void> initializeData() async {
    isLoading.value = true;
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      isLoading.value = false;
      hasError.value = false;
    } catch (e) {
      isLoading.value = false;
      hasError.value = true;
      errorMessage.value = e.toString();
    }
  }

  void increment() {
    counter.value++;
  }

  void decrement() {
    counter.value--;
  }
}
