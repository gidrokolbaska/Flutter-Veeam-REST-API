import 'package:get/get.dart';

import '../routes/app_pages.dart';
import '../services/REST_services.dart';

class LogoutController extends GetxController {
  RestServices restServices = RestServices();
  var canLogout = false.obs;
  Future fetchLogout() async {
    await restServices.logoutFromCurrentSession(RestServices.encodedSessionID!);
    Get.offAndToNamed(
      Routes.LOGIN,
    );
  }
}
