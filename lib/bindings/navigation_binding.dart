import 'package:get/get.dart';
import 'package:veeam_mobile_operator/controllers/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NavigationController>(NavigationController());
  }
}
