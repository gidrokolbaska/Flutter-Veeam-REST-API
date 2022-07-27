import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/jobscontroller.dart';

import '../controllers/logout_controller.dart';
import '../models/authModel.dart';
import '../models/jobs_model.dart';
import 'new_context_menu.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  _JobsScreenState createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  Future<JobsModel?>? jobs;
  Future<AuthModel?>? auth;
  JobsModel? jobsModel;
  final JobsController jobsController = Get.put(JobsController());
  final LogoutController logoutController = Get.find();
  var canScroll = true;
  @override
  void initState() {
    super.initState();

    getInstanceOfJobsFuture();
  }

  void getInstanceOfJobsFuture() async {
    jobs = jobsController
        .fetchJobs()
        .whenComplete(() => logoutController.canLogout.value = true);
    jobsModel = await jobs;
  }

  Future<void> _refresh() async {
    setState(() {
      canScroll = false;
    });

    final returnFromTheFuture = await jobsController.fetchJobs();
    setState(() {
      jobsModel = returnFromTheFuture;
      canScroll = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: jobs,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return RefreshIndicator(
            color: const Color(0xff328208),
            onRefresh: () {
              return _refresh();
            },
            child: ListView.separated(
              physics: canScroll == true
                  ? const AlwaysScrollableScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              itemCount: jobsModel!.jobs!.job!.length,
              itemBuilder: (BuildContext context, int index) {
                switch (index) {
                  case 1:
                    break;
                  default:
                }
                return CupertinoContextMenuNew(
                  actions: [
                    CupertinoContextMenuAction(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Start'),
                          Image.asset('assets/images/starting.png')
                        ],
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    CupertinoContextMenuAction(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Stop'),
                          Image.asset('assets/images/job_stop.png')
                        ],
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    CupertinoContextMenuAction(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Retry'),
                          Image.asset('assets/images/job_retry.png')
                        ],
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    CupertinoContextMenuAction(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Edit'),
                          Image.asset('assets/images/job_edit.png')
                        ],
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    CupertinoContextMenuAction(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Active Full'),
                          Image.asset('assets/images/job_active_full.png')
                        ],
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    CupertinoContextMenuAction(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Disable'),
                          Image.asset('assets/images/job_disable.png')
                        ],
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    CupertinoContextMenuAction(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Clone'),
                          Image.asset('assets/images/job_clone.png')
                        ],
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    CupertinoContextMenuAction(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delete'),
                          Image.asset('assets/images/job_delete.png')
                        ],
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                  child: Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Color(0xFFEEEEEE),
                    child: ListTile(
                      title: Text('${jobsModel!.jobs!.job![index].name}'),
                      subtitle: Text(
                          '${jobsModel!.jobs!.job![index].jobType!.description}'),
                      leading: jobsController
                                  .jobsStatuses[index]
                                  ?.queryResult
                                  .entities
                                  .backupJobSessions
                                  ?.backupJobSession
                                  ?.state
                                  ?.empty !=
                              null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset((() {
                                  switch (jobsController
                                      .jobsStatuses[index]
                                      ?.queryResult
                                      .entities
                                      .backupJobSessions
                                      ?.backupJobSession
                                      ?.state
                                      ?.empty) {
                                    case 'Stopped':
                                      switch (jobsController
                                          .jobsStatuses[index]
                                          ?.queryResult
                                          .entities
                                          .backupJobSessions
                                          ?.backupJobSession
                                          ?.result
                                          ?.empty) {
                                        case 'Success':
                                          return 'assets/images/success.png';
                                        case 'Failed':
                                          return 'assets/images/error.png';
                                        case 'Warning':
                                          return 'assets/images/warning.png';
                                        default:
                                          return '';
                                      }

                                    case 'Starting':
                                      return 'assets/images/starting.png';
                                    case 'Working':
                                      return 'assets/images/progress.png';
                                    default:
                                      return '';
                                  }
                                })()),
                                ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: 40.0),
                                  child: Text(
                                    (() {
                                      switch (jobsController
                                          .jobsStatuses[index]
                                          ?.queryResult
                                          .entities
                                          .backupJobSessions
                                          ?.backupJobSession
                                          ?.state
                                          ?.empty) {
                                        case 'Stopped':
                                          switch (jobsController
                                              .jobsStatuses[index]
                                              ?.queryResult
                                              .entities
                                              .backupJobSessions
                                              ?.backupJobSession
                                              ?.result
                                              ?.empty) {
                                            case 'Success':
                                              return 'Success';
                                            case 'Failed':
                                              return 'Failed';
                                            case 'Warning':
                                              return 'Warning';
                                            default:
                                              return '';
                                          }

                                        case 'Starting':
                                          return 'Starting';
                                        case 'Working':
                                          return 'Working';
                                        default:
                                          return '';
                                      }
                                    })(),
                                    style: const TextStyle(fontSize: 10.0),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Image.asset(
                                        'assets/images/never-started.png')),
                                ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: 40.0),
                                  child: const Text(
                                    'Never started',
                                    style: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
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
                  valueColor: AlwaysStoppedAnimation(Color(0xff328208)),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Loading Jobs',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
