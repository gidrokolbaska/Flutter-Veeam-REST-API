import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:veeam_mobile_operator/controllers/navigation_controller.dart';

import 'package:veeam_mobile_operator/routes/app_pages.dart';
import 'package:veeam_mobile_operator/widgets/dashboard.dart';
import 'package:veeam_mobile_operator/widgets/drawer.dart';
import 'package:veeam_mobile_operator/widgets/jobs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'REST API Demo',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Color(0xff005f4b)),
        scaffoldBackgroundColor: Color(0xFFEEEEEE),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: const Color(0xff005f4b)),
        ),
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Color(0xff005f4b)),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff005f4b),
              width: 2.0,
            ),
          ),
        ),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

class MyHomePage extends GetView<NavigationController> {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff328208),
            title: const Text('Veeam REST API Demo'),
          ),
          drawer: AppDrawer(),
          body: IndexedStack(
            index: controller.tabIndex.value,
            children: [const JobsScreen(), Dashboard()],
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            selectedFontSize: 15.0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            backgroundColor: const Color(0xff328208),
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex.value,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Jobs',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Dashboard',
              ),
            ],
          ),
        ));
  }
}
