import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veeam_mobile_operator/models/backupServerDetailsModel.dart';
import 'package:veeam_mobile_operator/models/summaryModel.dart';

import '../models/backupServersBasicModel.dart';
import '../services/REST_services.dart';

class DashboardController extends GetxController {
  RestServices restServices = RestServices();
  SummaryStatus? summaryStatusModel;
  Future<SummaryStatus?>? summaryStatus;
  List<BackupServersDetailsModel?> backupServersDetails =
      <BackupServersDetailsModel>[].obs;
  late BackupServersBasicModel? backupServersBasicModel;
  BackupServersDetailsModel? backupServersDetailsModel;
  var selectedIndexBackupServers;
  var ipdnsOfBackupServerController = TextEditingController().obs;
  var serverDescriptionController = TextEditingController().obs;
  var portController = TextEditingController().obs;
  var usernameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  @override
  void onInit() async {
    super.onInit();
    getInstanceOfSummaryFuture();
    await backupServersInfo();

    selectedIndexBackupServers = (backupServersDetails.length + 1).obs;
  }

  void getInstanceOfSummaryFuture() async {
    summaryStatus = restServices.fetchSummary();
    summaryStatusModel = await summaryStatus;
  }

  Future<BackupServersBasicModel?> backupServersInfo() async {
    backupServersBasicModel = (await restServices.fetchBackupServers())!;
    backupServersDetails.clear();
    backupServersDetails.length = 0;
    if (backupServersBasicModel != null) {
      for (var i = 0;
          i < backupServersBasicModel!.entityReferences!.ref!.length;
          i++) {
        backupServersDetails.add(await fetchBackupServerDetails(
            '${backupServersBasicModel!.entityReferences!.ref![i].links!.link!.where((element) => element.href!.contains('format=Entity')).first.href}'));
      }

      return backupServersBasicModel;
    } else {
      return null;
    }
  }

  Future<BackupServersDetailsModel?> fetchBackupServerDetails(
      String link) async {
    backupServersDetailsModel =
        await restServices.fetchBackupServersDetails(link);

    if (backupServersDetailsModel != null) {
      return backupServersDetailsModel;
    } else {
      return null;
    }
  }

  clearBackupServerTextEditingControllers() {
    ipdnsOfBackupServerController.value.clear();
    serverDescriptionController.value.clear();
    portController.value.clear();
    usernameController.value.clear();
    passwordController.value.clear();
  }

  Future editbackupServer(String link, String description, String dnsNameOrIp,
      String username, String password, String port) async {
    await restServices.editBackupServerSettings(
        link, description, dnsNameOrIp, username, password, port);
  }
}
