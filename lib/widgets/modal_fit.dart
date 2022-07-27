import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:veeam_mobile_operator/controllers/dashboard_controller.dart';

class ModalFit extends StatelessWidget {
  const ModalFit({Key? key, required this.dashboardController})
      : super(key: key);
  final DashboardController dashboardController;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xff328208),
            middle: Text(
              'Backup Servers',
              style: TextStyle(color: Colors.white),
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Stack(children: [
              Obx(
                () => ListView(
                  padding: const EdgeInsets.only(top: 60.0),
                  controller: ModalScrollController.of(context),
                  physics: const ClampingScrollPhysics(),
                  children: ListTile.divideTiles(
                      context: context,
                      tiles: List.generate(
                        dashboardController.backupServersDetails.length,
                        (index) => Material(
                          child: ListTile(
                            onTap: () {
                              dashboardController
                                  .selectedIndexBackupServers.value = index;
                            },
                            tileColor: dashboardController
                                        .selectedIndexBackupServers.value ==
                                    index
                                ? Colors.grey
                                : Colors.grey.shade200,
                            leading: Image.asset(
                              'assets/images/server.png',
                              width: 25,
                            ),
                            title: Text(
                                '${dashboardController.backupServersDetails[index]!.backupServer!.name}'),
                          ),
                        ),
                      )).toList(),
                ),
              ),
              Positioned(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipOval(
                        child: Material(
                          color: Colors.white, // Button color
                          child: InkWell(
                            splashColor: Colors.black12, // Splash color
                            onTap: () {},
                            child: SizedBox(
                                width: 56,
                                height: 56,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.add_box_outlined),
                                    Text(
                                      'Add',
                                      style: TextStyle(fontSize: 12.5),
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ),
                      ClipOval(
                        child: Material(
                          color: Colors.white, // Button color
                          child: InkWell(
                            splashColor: Colors.black12, // Splash color
                            onTap: () {
                              if (dashboardController
                                      .selectedIndexBackupServers !=
                                  dashboardController
                                          .backupServersDetails.length +
                                      1) {
                                //set existing text values for the selected backupserver
                                dashboardController
                                        .ipdnsOfBackupServerController
                                        .value
                                        .text =
                                    dashboardController
                                        .backupServersDetails[
                                            dashboardController
                                                .selectedIndexBackupServers
                                                .value]!
                                        .backupServer!
                                        .name!;
                                if (dashboardController
                                        .backupServersDetails[
                                            dashboardController
                                                .selectedIndexBackupServers
                                                .value]!
                                        .backupServer!
                                        .description!
                                        .empty !=
                                    null) {
                                  dashboardController
                                          .serverDescriptionController
                                          .value
                                          .text =
                                      dashboardController
                                          .backupServersDetails[
                                              dashboardController
                                                  .selectedIndexBackupServers
                                                  .value]!
                                          .backupServer!
                                          .description!
                                          .empty!;
                                }

                                dashboardController.portController.value.text =
                                    dashboardController
                                        .backupServersDetails[
                                            dashboardController
                                                .selectedIndexBackupServers
                                                .value]!
                                        .backupServer!
                                        .port!
                                        .empty!;
                                showCupertinoModalBottomSheet(
                                  expand: true,
                                  isDismissible: false,
                                  enableDrag: false,
                                  context: context,
                                  backgroundColor: Colors.white,
                                  builder: (context) => Material(
                                    child: CupertinoPageScaffold(
                                      navigationBar:
                                          const CupertinoNavigationBar(
                                        automaticallyImplyLeading: false,
                                        backgroundColor: Color(0xff328208),
                                        middle: Text(
                                          'Backup Server Settings',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      child: SingleChildScrollView(
                                        child: SafeArea(
                                          bottom: true,
                                          child: Form(
                                            autovalidateMode:
                                                AutovalidateMode.always,
                                            onChanged: () {
                                              Form.of(primaryFocus!.context!)
                                                  ?.save();
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              //mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CupertinoFormSection
                                                    .insetGrouped(
                                                  backgroundColor:
                                                      Colors.grey.shade200,
                                                  header: const Text(
                                                      'DNS name or IP address of the Veeam Backup server'),
                                                  children: [
                                                    CupertinoTextFormFieldRow(
                                                      controller:
                                                          dashboardController
                                                              .ipdnsOfBackupServerController
                                                              .value,
                                                      cursorColor: const Color(
                                                          0xff005f4b),
                                                      prefix: const Icon(
                                                          Icons.domain),
                                                      validator:
                                                          (String? value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Please enter a value';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                CupertinoFormSection
                                                    .insetGrouped(
                                                  backgroundColor:
                                                      Colors.grey.shade200,
                                                  header: const Text(
                                                      'Server description'),
                                                  children: [
                                                    CupertinoTextFormFieldRow(
                                                      controller:
                                                          dashboardController
                                                              .serverDescriptionController
                                                              .value,
                                                      cursorColor: const Color(
                                                          0xff005f4b),
                                                      prefix: const Icon(
                                                          Icons.description),
                                                      minLines: null,
                                                      maxLines: null,
                                                      expands: true,
                                                    ),
                                                  ],
                                                ),
                                                CupertinoFormSection
                                                    .insetGrouped(
                                                  backgroundColor:
                                                      Colors.grey.shade200,
                                                  header:
                                                      const Text('Username'),
                                                  children: [
                                                    CupertinoTextFormFieldRow(
                                                      controller:
                                                          dashboardController
                                                              .usernameController
                                                              .value,
                                                      cursorColor: const Color(
                                                          0xff005f4b),
                                                      prefix: const Icon(
                                                          Icons.account_circle),
                                                      validator:
                                                          (String? value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Please enter a value';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                CupertinoFormSection
                                                    .insetGrouped(
                                                  backgroundColor:
                                                      Colors.grey.shade200,
                                                  header:
                                                      const Text('Password'),
                                                  children: [
                                                    CupertinoTextFormFieldRow(
                                                      controller:
                                                          dashboardController
                                                              .passwordController
                                                              .value,
                                                      cursorColor: const Color(
                                                          0xff005f4b),
                                                      prefix: const Icon(
                                                          Icons.password),
                                                      obscureText: true,
                                                      validator:
                                                          (String? value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Please enter a value';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                CupertinoFormSection
                                                    .insetGrouped(
                                                  backgroundColor:
                                                      Colors.grey.shade200,
                                                  header: const Text('Port'),
                                                  children: [
                                                    CupertinoTextFormFieldRow(
                                                      controller:
                                                          dashboardController
                                                              .portController
                                                              .value,
                                                      cursorColor: const Color(
                                                          0xff005f4b),
                                                      prefix: const Icon(
                                                          Icons.compare_arrows),
                                                      validator:
                                                          (String? value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Please enter a value';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    ElevatedButton(
                                                      child: const Text('OK'),
                                                      onPressed: () async {
                                                        if (dashboardController
                                                                .usernameController
                                                                .value
                                                                .text
                                                                .isNotEmpty &&
                                                            dashboardController
                                                                .passwordController
                                                                .value
                                                                .text
                                                                .isNotEmpty) {
                                                          await dashboardController.editbackupServer(
                                                              dashboardController
                                                                  .backupServersDetails[
                                                                      dashboardController
                                                                          .selectedIndexBackupServers
                                                                          .value]!
                                                                  .backupServer!
                                                                  .href!,
                                                              dashboardController
                                                                  .serverDescriptionController
                                                                  .value
                                                                  .text,
                                                              dashboardController
                                                                  .ipdnsOfBackupServerController
                                                                  .value
                                                                  .text,
                                                              dashboardController
                                                                  .usernameController
                                                                  .value
                                                                  .text,
                                                              dashboardController
                                                                  .passwordController
                                                                  .value
                                                                  .text,
                                                              dashboardController
                                                                  .portController
                                                                  .value
                                                                  .text);
                                                          await dashboardController
                                                              .backupServersInfo();
                                                          dashboardController
                                                              .clearBackupServerTextEditingControllers();
                                                          Get.back();
                                                        } else {
                                                          Get.snackbar(
                                                              'Warning',
                                                              'Enter all the required values');
                                                        }
                                                      },
                                                    ),
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              primary:
                                                                  Colors.grey),
                                                      child:
                                                          const Text('Cancel'),
                                                      onPressed: () {
                                                        Get.back();
                                                        dashboardController
                                                            .clearBackupServerTextEditingControllers();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                Get.snackbar(
                                    'Warning', 'Select the server first',
                                    backgroundColor: Colors.white);
                              }
                            },
                            child: SizedBox(
                                width: 56,
                                height: 56,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.edit),
                                    Text('Edit',
                                        style: TextStyle(fontSize: 12.5))
                                  ],
                                )),
                          ),
                        ),
                      ),
                      ClipOval(
                        child: Material(
                          color: Colors.white, // Button color
                          child: InkWell(
                            splashColor: Colors.black12, // Splash color
                            onTap: () {},
                            child: SizedBox(
                                width: 56,
                                height: 56,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.delete),
                                    Text('Remove',
                                        style: TextStyle(fontSize: 12.5))
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          )),
    );
  }
}
