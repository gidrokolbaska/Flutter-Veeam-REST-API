import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/authModel.dart';
import '../routes/app_pages.dart';
import '../services/REST_services.dart';

class LoginController extends GetxController {
  var isChecked = false.obs;
  final _storageKey = 'isDataSaved';
  final _serverKey = 'server';
  final _loginKey = 'login';
  SharedPreferences? prefs;
  var serverController = TextEditingController().obs;
  var loginController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs!.getBool(_storageKey) == true) {
      serverController.value.text = prefs!.getString(_serverKey)!;

      loginController.value.text = prefs!.getString(_loginKey)!;
      isChecked.value = true;
    }
    super.onInit();
  }

  RestServices restServices = RestServices();
  AuthModel? auth;
  void login(BuildContext context, serText, logText, pass) async {
    context.loaderOverlay.show();
    fetchAuthentication(context, serText, logText, pass);
  }

  Future<AuthModel?> fetchAuthentication(BuildContext context, String serText,
      String logText, String password) async {
    auth = await restServices.fetchAuthLinks(serText, logText, password);
    if (auth != null) {
      context.loaderOverlay.hide();
      if (isChecked.value == true) {
        await prefs!.setString(_serverKey, serText);
        await prefs!.setString(_loginKey, logText);
        await prefs!.setBool(_storageKey, isChecked.value);
      } else {
        await prefs!.remove(_serverKey);
        await prefs!.remove(_loginKey);
        await prefs!.remove(_storageKey);
      }
      Get.offAndToNamed(
        Routes.HOME,
      );
      return auth;
    } else {
      context.loaderOverlay.hide();
    }
  }
}
