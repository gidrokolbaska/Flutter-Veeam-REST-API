// To parse this JSON data, do
//
//     final summaryStatus = summaryStatusFromJson(jsonString);

import 'dart:convert';

SummaryStatus summaryStatusFromJson(String str) =>
    SummaryStatus.fromJson(json.decode(str));

String summaryStatusToJson(SummaryStatus data) => json.encode(data.toJson());

class SummaryStatus {
  SummaryStatus({
    this.overviewReportFrame,
  });

  OverviewReportFrame? overviewReportFrame;

  factory SummaryStatus.fromJson(Map<String, dynamic> json) => SummaryStatus(
        overviewReportFrame: json["OverviewReportFrame"] == null
            ? null
            : OverviewReportFrame.fromJson(json["OverviewReportFrame"]),
      );

  Map<String, dynamic> toJson() => {
        "OverviewReportFrame":
            overviewReportFrame == null ? null : overviewReportFrame!.toJson(),
      };
}

class OverviewReportFrame {
  OverviewReportFrame({
    this.xmlns,
    this.backupServers,
    this.proxyServers,
    this.repositoryServers,
    this.runningJobs,
    this.scheduledJobs,
    this.successfulVmLastestStates,
    this.warningVmLastestStates,
    this.failedVmLastestStates,
  });

  List<Xmln>? xmlns;
  BackupServers? backupServers;
  BackupServers? proxyServers;
  BackupServers? repositoryServers;
  BackupServers? runningJobs;
  BackupServers? scheduledJobs;
  BackupServers? successfulVmLastestStates;
  BackupServers? warningVmLastestStates;
  BackupServers? failedVmLastestStates;

  factory OverviewReportFrame.fromJson(Map<String, dynamic> json) =>
      OverviewReportFrame(
        xmlns: json["@xmlns"] == null
            ? null
            : List<Xmln>.from(json["@xmlns"].map((x) => Xmln.fromJson(x))),
        backupServers: json["BackupServers"] == null
            ? null
            : BackupServers.fromJson(json["BackupServers"]),
        proxyServers: json["ProxyServers"] == null
            ? null
            : BackupServers.fromJson(json["ProxyServers"]),
        repositoryServers: json["RepositoryServers"] == null
            ? null
            : BackupServers.fromJson(json["RepositoryServers"]),
        runningJobs: json["RunningJobs"] == null
            ? null
            : BackupServers.fromJson(json["RunningJobs"]),
        scheduledJobs: json["ScheduledJobs"] == null
            ? null
            : BackupServers.fromJson(json["ScheduledJobs"]),
        successfulVmLastestStates: json["SuccessfulVmLastestStates"] == null
            ? null
            : BackupServers.fromJson(json["SuccessfulVmLastestStates"]),
        warningVmLastestStates: json["WarningVmLastestStates"] == null
            ? null
            : BackupServers.fromJson(json["WarningVmLastestStates"]),
        failedVmLastestStates: json["FailedVmLastestStates"] == null
            ? null
            : BackupServers.fromJson(json["FailedVmLastestStates"]),
      );

  Map<String, dynamic> toJson() => {
        "@xmlns": xmlns == null
            ? null
            : List<dynamic>.from(xmlns!.map((x) => x.toJson())),
        "BackupServers": backupServers == null ? null : backupServers!.toJson(),
        "ProxyServers": proxyServers == null ? null : proxyServers!.toJson(),
        "RepositoryServers":
            repositoryServers == null ? null : repositoryServers!.toJson(),
        "RunningJobs": runningJobs == null ? null : runningJobs!.toJson(),
        "ScheduledJobs": scheduledJobs == null ? null : scheduledJobs!.toJson(),
        "SuccessfulVmLastestStates": successfulVmLastestStates == null
            ? null
            : successfulVmLastestStates!.toJson(),
        "WarningVmLastestStates": warningVmLastestStates == null
            ? null
            : warningVmLastestStates!.toJson(),
        "FailedVmLastestStates": failedVmLastestStates == null
            ? null
            : failedVmLastestStates!.toJson(),
      };
}

class BackupServers {
  BackupServers({
    this.empty,
  });

  String? empty;

  factory BackupServers.fromJson(Map<String, dynamic> json) => BackupServers(
        empty: json["\u0024"] == null ? null : json["\u0024"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024": empty == null ? null : empty,
      };
}

class Xmln {
  Xmln({
    this.xsd,
    this.xsi,
    this.empty,
  });

  String? xsd;
  String? xsi;
  String? empty;

  factory Xmln.fromJson(Map<String, dynamic> json) => Xmln(
        xsd: json["xsd"] == null ? null : json["xsd"],
        xsi: json["xsi"] == null ? null : json["xsi"],
        empty: json["\u0024"] == null ? null : json["\u0024"],
      );

  Map<String, dynamic> toJson() => {
        "xsd": xsd == null ? null : xsd,
        "xsi": xsi == null ? null : xsi,
        "\u0024": empty == null ? null : empty,
      };
}
