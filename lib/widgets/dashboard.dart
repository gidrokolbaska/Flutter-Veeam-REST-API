import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:veeam_mobile_operator/controllers/dashboard_controller.dart';
import 'package:veeam_mobile_operator/services/REST_services.dart';

import 'modal_fit.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  final RestServices restServices = RestServices();
  final DashboardController dashboardController =
      Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 262,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 20,
                        top: 20,
                        child: Text(
                          "Summary",
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.032,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.75,
                          ),
                        ),
                      ),
                      FutureBuilder(
                        future: dashboardController.summaryStatus,
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData) {
                            return Positioned(
                              left: 20,
                              top: 90,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Backup Servers: ',
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.026,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                          text:
                                              '${dashboardController.summaryStatusModel!.overviewReportFrame!.backupServers!.empty}',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.026,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              await CupertinoScaffold
                                                  .showCupertinoModalBottomSheet(
                                                expand: true,
                                                context: context,
                                                backgroundColor: Colors.white,
                                                builder: (context) => ModalFit(
                                                  dashboardController:
                                                      dashboardController,
                                                ),
                                              );
                                              //Resetting the selected index for the backup server
                                              dashboardController
                                                  .selectedIndexBackupServers
                                                  .value = dashboardController
                                                      .backupServersDetails
                                                      .length +
                                                  1;
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Proxy Servers: ',
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.026,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                          text:
                                              '${dashboardController.summaryStatusModel!.overviewReportFrame!.proxyServers!.empty}',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.026,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              print('proxy servers details');
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Running Jobs: ',
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.026,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                          text:
                                              '${dashboardController.summaryStatusModel!.overviewReportFrame!.runningJobs!.empty}',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.026,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              print('running jobs details');
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Scheduled Jobs: ',
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.026,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                          text:
                                              '${dashboardController.summaryStatusModel!.overviewReportFrame!.scheduledJobs!.empty}',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.026,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              print('scheduled jobs details');
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          } else {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(
                                        Color(0xff328208)),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    'Loading summary',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 26.60),
                Container(
                  height: 262,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 20,
                        top: 20,
                        child: Text(
                          'Job statistics',
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.022,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.75,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 26.60),
                Container(
                  height: 262,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 20,
                        top: 20,
                        child: Text(
                          'Repository status',
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.022,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.75,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
