// To parse this JSON data, do
//
//     final jobStatus = jobStatusFromJson(jsonString);

import 'dart:convert';

JobStatus jobStatusFromJson(String str) => JobStatus.fromJson(json.decode(str));

String jobStatusToJson(JobStatus data) => json.encode(data.toJson());

class JobStatus {
  JobStatus({
    required this.queryResult,
  });

  QueryResult queryResult;

  factory JobStatus.fromJson(Map<String, dynamic> json) => JobStatus(
        queryResult: QueryResult.fromJson(json["QueryResult"]),
      );

  Map<String, dynamic> toJson() => {
        "QueryResult": queryResult.toJson(),
      };
}

class QueryResult {
  QueryResult({
    required this.xmlns,
    required this.entities,
    required this.pagingInfo,
  });

  List<Xmln> xmlns;
  Entities entities;
  PagingInfo? pagingInfo;

  factory QueryResult.fromJson(Map<String, dynamic> json) => QueryResult(
        xmlns: List<Xmln>.from(json["@xmlns"].map((x) => Xmln.fromJson(x))),
        entities: Entities.fromJson(json["Entities"]),
        pagingInfo: json["PagingInfo"] == null
            ? null
            : PagingInfo.fromJson(json["PagingInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "@xmlns": List<dynamic>.from(xmlns.map((x) => x.toJson())),
        "Entities": entities.toJson(),
        "PagingInfo": pagingInfo!.toJson(),
      };
}

class Entities {
  Entities({
    this.backupJobSessions,
  });

  BackupJobSessions? backupJobSessions;

  factory Entities.fromJson(Map<String, dynamic> json) => Entities(
        backupJobSessions:
            BackupJobSessions.fromJson(json["BackupJobSessions"]),
      );

  Map<String, dynamic> toJson() => {
        "BackupJobSessions": backupJobSessions!.toJson(),
      };
}

class BackupJobSessions {
  BackupJobSessions({
    this.backupJobSession,
  });

  BackupJobSession? backupJobSession;

  factory BackupJobSessions.fromJson(Map<String, dynamic> json) =>
      BackupJobSessions(
        backupJobSession: json["BackupJobSession"] == null
            ? null
            : BackupJobSession.fromJson(json["BackupJobSession"]),
      );

  Map<String, dynamic> toJson() => {
        "BackupJobSession": backupJobSession!.toJson(),
      };
}

class BackupJobSession {
  BackupJobSession({
    this.href,
    this.type,
    this.name,
    this.uid,
    this.links,
    this.jobUid,
    this.jobName,
    this.jobType,
    this.creationTimeUtc,
    this.endTimeUtc,
    this.state,
    this.result,
    this.progress,
    this.isRetry,
  });

  String? href;
  String? type;
  String? name;
  String? uid;
  BackupJobSessionLinks? links;
  CreationTimeUtc? jobUid;
  CreationTimeUtc? jobName;
  CreationTimeUtc? jobType;
  CreationTimeUtc? creationTimeUtc;
  CreationTimeUtc? endTimeUtc;
  CreationTimeUtc? state;
  CreationTimeUtc? result;
  CreationTimeUtc? progress;
  CreationTimeUtc? isRetry;

  factory BackupJobSession.fromJson(Map<String, dynamic> json) =>
      BackupJobSession(
        href: json["@Href"],
        type: json["@Type"],
        name: json["@Name"],
        uid: json["@UID"],
        links: BackupJobSessionLinks.fromJson(json["Links"]),
        jobUid: CreationTimeUtc.fromJson(json["JobUid"]),
        jobName: CreationTimeUtc.fromJson(json["JobName"]),
        jobType: CreationTimeUtc.fromJson(json["JobType"]),
        creationTimeUtc: CreationTimeUtc.fromJson(json["CreationTimeUTC"]),
        endTimeUtc: json["EndTimeUTC"] == null
            ? null
            : CreationTimeUtc.fromJson(json["EndTimeUTC"]),
        state: CreationTimeUtc.fromJson(json["State"]),
        result: CreationTimeUtc.fromJson(json["Result"]),
        progress: CreationTimeUtc.fromJson(json["Progress"]),
        isRetry: CreationTimeUtc.fromJson(json["IsRetry"]),
      );

  Map<String, dynamic> toJson() => {
        "@Href": href,
        "@Type": type,
        "@Name": name,
        "@UID": uid,
        "Links": links!.toJson(),
        "JobUid": jobUid!.toJson(),
        "JobName": jobName!.toJson(),
        "JobType": jobType!.toJson(),
        "CreationTimeUTC": creationTimeUtc!.toJson(),
        "EndTimeUTC": endTimeUtc!.toJson(),
        "State": state!.toJson(),
        "Result": result!.toJson(),
        "Progress": progress!.toJson(),
        "IsRetry": isRetry!.toJson(),
      };
}

class CreationTimeUtc {
  CreationTimeUtc({
    this.empty,
  });

  String? empty;

  factory CreationTimeUtc.fromJson(Map<String, dynamic> json) =>
      CreationTimeUtc(
        empty: json["\u0024"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024": empty,
      };
}

class BackupJobSessionLinks {
  BackupJobSessionLinks({
    this.link,
  });

  List<PurpleLink>? link;

  factory BackupJobSessionLinks.fromJson(Map<String, dynamic> json) =>
      BackupJobSessionLinks(
        link: List<PurpleLink>.from(
            json["Link"].map((x) => PurpleLink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Link": List<dynamic>.from(link!.map((x) => x.toJson())),
      };
}

class PurpleLink {
  PurpleLink({
    this.href,
    this.name,
    this.type,
    this.rel,
  });

  String? href;
  String? name;
  String? type;
  String? rel;

  factory PurpleLink.fromJson(Map<String, dynamic> json) => PurpleLink(
        href: json["@Href"],
        name: json["@Name"] == null ? null : json["@Name"],
        type: json["@Type"] == null ? null : json["@Type"],
        rel: json["@Rel"],
      );

  Map<String, dynamic> toJson() => {
        "@Href": href,
        "@Name": name == null ? null : name,
        "@Type": type == null ? null : type,
        "@Rel": rel,
      };
}

class PagingInfo {
  PagingInfo({
    this.pageNum,
    this.pageSize,
    this.pagesCount,
    this.links,
  });

  String? pageNum;
  String? pageSize;
  String? pagesCount;
  PagingInfoLinks? links;

  factory PagingInfo.fromJson(Map<String, dynamic> json) => PagingInfo(
        pageNum: json["@PageNum"],
        pageSize: json["@PageSize"],
        pagesCount: json["@PagesCount"],
        links: PagingInfoLinks.fromJson(json["Links"]),
      );

  Map<String, dynamic> toJson() => {
        "@PageNum": pageNum,
        "@PageSize": pageSize,
        "@PagesCount": pagesCount,
        "Links": links!.toJson(),
      };
}

class PagingInfoLinks {
  PagingInfoLinks({
    this.link,
  });

  List<FluffyLink>? link;

  factory PagingInfoLinks.fromJson(Map<String, dynamic> json) =>
      PagingInfoLinks(
        link: List<FluffyLink>.from(
            json["Link"].map((x) => FluffyLink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Link": List<dynamic>.from(link!.map((x) => x.toJson())),
      };
}

class FluffyLink {
  FluffyLink({
    this.href,
    this.rel,
  });

  String? href;
  String? rel;

  factory FluffyLink.fromJson(Map<String, dynamic> json) => FluffyLink(
        href: json["@Href"],
        rel: json["@Rel"],
      );

  Map<String, dynamic> toJson() => {
        "@Href": href,
        "@Rel": rel,
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
