import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:http/io_client.dart' as ioclient;
import 'package:veeam_mobile_operator/models/authModel.dart';

import 'package:xml2json/xml2json.dart';

import '../models/backupServerDetailsModel.dart';
import '../models/backupServersBasicModel.dart';
import '../models/initialModel.dart';
import '../models/jobsStatusModel.dart';
import '../models/jobs_model.dart';
import '../models/summaryModel.dart';

class RestServices {
  static final _httpClient = HttpClient();
  static late http.Response response;
  static late ioclient.IOClient _ioClient;
  static String? basicAuth;
  static String? encodedSessionID;
  static String? loginName;
  static String? jobsLink;
  static AuthModel? authModel;
  static String? serverName;
  static final myTransformerToJSON = Xml2Json();
  Future fetchAuthLinks(String serverLink, String login, String pass) async {
    _httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    _ioClient = ioclient.IOClient(_httpClient);
    try {
      response = await _ioClient.get(Uri.parse(serverLink));
    } catch (e) {
      Get.snackbar('Error',
          "Server name is incorrect or you are not connected to server's network (e.g. via VPN)",
          snackPosition: SnackPosition.TOP);
      return;
    }

    myTransformerToJSON.parse(response.body);
    var json = myTransformerToJSON.toBadgerfish();
    var initialModel = initialModelFromJson(json);

    String? authLink = initialModel.enterpriseManager!.links!.link!
        .where((element) => element.href!.contains('latest'))
        .first
        .href;

    String username = login;
    String password = pass;
    basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

    var response2 = await _ioClient.post(Uri.parse(authLink!),
        headers: <String, String>{'authorization': basicAuth!});

    myTransformerToJSON.parse(response2.body);
    var jsonAuth = myTransformerToJSON.toBadgerfish();
    if (response2.statusCode != 401) {
      authModel = authModelFromJson(jsonAuth);
      var sessionID = authModel!.logonSession!.sessionId!.id;

      encodedSessionID =
          'X-RestSvcSessionId=' + base64Encode(utf8.encode(sessionID!));
      serverName = authModel!.logonSession!.links!.link![0].href;
      loginName = authModel!.logonSession!.userName!.id;
      return authModel!;
    } else {
      Get.snackbar('Warning', 'Login or password is incorrect',
          snackPosition: SnackPosition.TOP);
      return null;
    }
  }

  Future<JobsModel?> fetchJobs() async {
    var jobResponse = await _ioClient.get(
      Uri.parse(authModel!.logonSession!.links!.link!
          .where((element) => element.href!.contains('jobs?format=Entity'))
          .first
          .href!),
      headers: <String, String>{
        'Authorization': basicAuth!,
        'Cookie': encodedSessionID!
      },
    );
    if (response.statusCode == 200) {
      myTransformerToJSON.parse(jobResponse.body);
      var jsonJobs = myTransformerToJSON.toBadgerfish();
      var jobs = jobsModelFromJson(jsonJobs);

      return jobs;
    } else {
      return null;
    }
  }

  Future<JobStatus?> fetchJobStatus(String jobName) async {
    var statusLink =
        '$serverName/query?type=BackupJobSession&pageSize=1&format=Entities&sortDesc=CreationTime&filter=JobName=="$jobName"';

    var jobStatusResponse = await _ioClient.get(
      Uri.parse(statusLink),
      headers: <String, String>{
        'Authorization': basicAuth!,
        'Cookie': encodedSessionID!
      },
    );

    if (jobStatusResponse.statusCode == 200) {
      myTransformerToJSON.parse(jobStatusResponse.body);
      var jsonStatus = myTransformerToJSON.toBadgerfish();
      var statusFromJson = jobStatusFromJson(jsonStatus);
      // Clipboard.setData(ClipboardData(text: jsonStatus));
      return statusFromJson;
    } else {
      return null;
    }
  }

  Future logoutFromCurrentSession(String authSessionID) async {
    await _ioClient.delete(
      Uri.parse(authModel!.logonSession!.href!),
      headers: <String, String>{'Cookie': encodedSessionID!},
    );
  }

  Future<SummaryStatus?> fetchSummary() async {
    var summaryResponse = await _ioClient.get(
      Uri.parse('$serverName/reports/summary/overview'),
      headers: <String, String>{
        'Cookie': encodedSessionID!,
        'Authorization': basicAuth!
      },
    );
    if (summaryResponse.statusCode == 200) {
      myTransformerToJSON.parse(summaryResponse.body);
      var jsonSummary = myTransformerToJSON.toBadgerfish();
      final summaryStatus = summaryStatusFromJson(jsonSummary);
      return summaryStatus;
    } else {
      return null;
    }
  }

  Future<BackupServersBasicModel?> fetchBackupServers() async {
    var backupserversResponse = await _ioClient.get(
      Uri.parse(
        '$serverName/backupServers',
      ),
      headers: <String, String>{
        'Cookie': encodedSessionID!,
        'Authorization': basicAuth!
      },
    );
    if (backupserversResponse.statusCode == 200) {
      myTransformerToJSON.parse(backupserversResponse.body);

      var jsonBackupServers = myTransformerToJSON.toBadgerfish();
      final backupServersBasicModel =
          backupServersBasicModelFromJson(jsonBackupServers);

      return backupServersBasicModel;
    } else {
      return null;
    }
  }

  Future<BackupServersDetailsModel?> fetchBackupServersDetails(
      String link) async {
    var backupserversDetailsResponse = await _ioClient.get(
      Uri.parse(link),
      headers: <String, String>{
        'Cookie': encodedSessionID!,
        'Authorization': basicAuth!
      },
    );
    if (backupserversDetailsResponse.statusCode == 200) {
      myTransformerToJSON.parse(backupserversDetailsResponse.body);

      var jsonBackupServersDetails = myTransformerToJSON.toBadgerfish();
      Clipboard.setData(ClipboardData(text: jsonBackupServersDetails));
      final backupServersDetailsModel =
          backupServersDetailsModelFromJson(jsonBackupServersDetails);
      return backupServersDetailsModel;
    } else {
      return null;
    }
  }

  Future editBackupServerSettings(String link, String description,
      String dnsNameOrIp, String username, String password, String port) async {
    Map data = {
      'Description': description,
      'DnsNameOrIpAddress': dnsNameOrIp,
      'Port': port,
      'Username': username,
      'Password': password
    };
    //encode Map to JSON
    var body = json.encode(data);

    var result = await _ioClient.put(Uri.parse(link),
        headers: <String, String>{
          'Cookie': encodedSessionID!,
          'Authorization': basicAuth!,
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: body);

    if (result.statusCode != 204) {
      Get.snackbar('Error', result.body);
    }
  }
}
