import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veeam_mobile_operator/services/REST_services.dart';

import '../controllers/logout_controller.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);
  final LogoutController logoutController = Get.put(LogoutController());

  void getLogout() async {
    if (logoutController.canLogout.value) {
      logoutController.fetchLogout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff328208),
      child: SafeArea(
        bottom: false,
        top: true,
        child: Drawer(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15.0),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                color: const Color(0xff328208),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${RestServices.loginName}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        getLogout();
                      },
                      child: const Text('Log out'),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Option 1'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Option 2'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Option 3'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Option 4'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
