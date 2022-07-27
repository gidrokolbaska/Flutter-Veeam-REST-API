import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        //backgroundColor:Get.isDarkMode? Constants.:Constants.kGrayBgColor,
        body: SafeArea(
          bottom: false,
          top: true,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    //width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/em_logo.png',
                      scale: .4,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Text(
                    'Veeam Backup & Replication mobile',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff005f4b),
                        fontSize: MediaQuery.of(context).size.width * 0.047),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Obx(
                    () => Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: controller.serverController.value,
                              autocorrect: false,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.033),
                                helperText:
                                    'e.g.: https://server1.test.veeam.local:9398/api/',
                                hintText:
                                    'Address of the server with port 9398/api at the end',
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            TextField(
                              controller: controller.loginController.value,
                              autocorrect: false,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.033),
                                hintText: 'Login',
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            TextField(
                              controller: controller.passwordController.value,
                              autocorrect: false,
                              obscureText: true,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                hintStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.033),
                                hintText: 'Password',
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              children: [
                                Platform.isIOS
                                    ? CupertinoSwitch(
                                        activeColor: const Color(0xff005f4b),
                                        value: controller.isChecked.value,
                                        onChanged: (onChanged) {
                                          controller.isChecked.value =
                                              onChanged;
                                        })
                                    : Checkbox(
                                        value: controller.isChecked.value,
                                        onChanged: (onChanged) {
                                          controller.isChecked.value =
                                              onChanged!;
                                        }),
                                const Text('Remember Server and Login'),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.10,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.login(
                                    context,
                                    controller.serverController.value.text,
                                    controller.loginController.value.text,
                                    controller.passwordController.value.text);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height:
                                    MediaQuery.of(context).size.height * 0.055,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xff005f4b)),
                                child: const Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
