import 'package:get/instance_manager.dart';
import '/src/ui/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        city: 'Bengaluru',
        searchText: 'Bengaluru',
      ),
    );
    //HomeController(city: '京都市'));
  }
}
