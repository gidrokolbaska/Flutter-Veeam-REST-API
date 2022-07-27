// To parse this JSON data, do
//
//     final jobsModel = jobsModelFromJson(jsonString);

import 'dart:convert';

JobsModel jobsModelFromJson(String str) => JobsModel.fromJson(json.decode(str));

String jobsModelToJson(JobsModel data) => json.encode(data.toJson());

class JobsModel {
  JobsModel({
    this.jobs,
  });

  Jobs? jobs;

  factory JobsModel.fromJson(Map<String, dynamic> json) => JobsModel(
        jobs: Jobs.fromJson(json["Jobs"]),
      );

  Map<String, dynamic> toJson() => {
        "Jobs": jobs!.toJson(),
      };
}

class Jobs {
  Jobs({
    this.xmlns,
    this.job,
  });

  List<Xmln>? xmlns;
  List<Job>? job;

  factory Jobs.fromJson(Map<String, dynamic> json) => Jobs(
        xmlns: List<Xmln>.from(json["@xmlns"].map((x) => Xmln.fromJson(x))),
        job: List<Job>.from(json["Job"].map((x) => Job.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@xmlns": List<dynamic>.from(xmlns!.map((x) => x.toJson())),
        "Job": List<dynamic>.from(job!.map((x) => x.toJson())),
      };
}

class Job {
  Job({
    this.href,
    this.type,
    this.name,
    this.uid,
    this.links,
    this.jobType,
    this.platform,
    this.description,
    this.scheduleConfigured,
    this.scheduleEnabled,
    this.nextRun,
    this.jobScheduleOptions,
    this.jobInfo,
  });

  String? href;
  JobType? type;
  String? name;
  String? uid;
  Links? links;
  Description? jobType;
  Description? platform;
  Description? description;
  Description? scheduleConfigured;
  Description? scheduleEnabled;
  Description? nextRun;
  JobScheduleOptions? jobScheduleOptions;
  JobInfo? jobInfo;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        href: json["@Href"],
        type: jobTypeValues.map[json["@Type"]],
        name: json["@Name"],
        uid: json["@UID"],
        links: Links.fromJson(json["Links"]),
        jobType: Description.fromJson(json["JobType"]),
        platform: Description.fromJson(json["Platform"]),
        description: Description.fromJson(json["Description"]),
        scheduleConfigured: Description.fromJson(json["ScheduleConfigured"]),
        scheduleEnabled: Description.fromJson(json["ScheduleEnabled"]),
        nextRun: json["NextRun"] == null
            ? null
            : Description.fromJson(json["NextRun"]),
        jobScheduleOptions:
            JobScheduleOptions.fromJson(json["JobScheduleOptions"]),
        jobInfo: JobInfo.fromJson(json["JobInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "@Href": href,
        "@Type": jobTypeValues.reverse[type],
        "@Name": name,
        "@UID": uid,
        "Links": links!.toJson(),
        "JobType": jobType!.toJson(),
        "Platform": platform!.toJson(),
        "Description": description!.toJson(),
        "ScheduleConfigured": scheduleConfigured!.toJson(),
        "ScheduleEnabled": scheduleEnabled!.toJson(),
        "NextRun": nextRun == null ? null : nextRun!.toJson(),
        "JobScheduleOptions": jobScheduleOptions!.toJson(),
        "JobInfo": jobInfo!.toJson(),
      };
}

class Description {
  Description({
    this.description,
  });

  String? description;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        description: json["\u0024"] == null ? null : json["\u0024"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024": description == null ? null : description,
      };
}

class JobInfo {
  JobInfo({
    this.backupJobInfo,
    this.backupCopyJobInfo,
    this.immediateBackupCopyJobInfo,
    this.replicaJobInfo,
  });

  BackupJobInfo? backupJobInfo;
  BackupCopyJobInfo? backupCopyJobInfo;
  ImmediateBackupCopyJobInfo? immediateBackupCopyJobInfo;
  ReplicaJobInfo? replicaJobInfo;

  factory JobInfo.fromJson(Map<String, dynamic> json) => JobInfo(
        backupJobInfo: json["BackupJobInfo"] == null
            ? null
            : BackupJobInfo.fromJson(json["BackupJobInfo"]),
        backupCopyJobInfo: json["BackupCopyJobInfo"] == null
            ? null
            : BackupCopyJobInfo.fromJson(json["BackupCopyJobInfo"]),
        immediateBackupCopyJobInfo: json["ImmediateBackupCopyJobInfo"] == null
            ? null
            : ImmediateBackupCopyJobInfo.fromJson(
                json["ImmediateBackupCopyJobInfo"]),
        replicaJobInfo: json["ReplicaJobInfo"] == null
            ? null
            : ReplicaJobInfo.fromJson(json["ReplicaJobInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "BackupJobInfo": backupJobInfo == null ? null : backupJobInfo!.toJson(),
        "BackupCopyJobInfo":
            backupCopyJobInfo == null ? null : backupCopyJobInfo!.toJson(),
        "ImmediateBackupCopyJobInfo": immediateBackupCopyJobInfo == null
            ? null
            : immediateBackupCopyJobInfo!.toJson(),
        "ReplicaJobInfo":
            replicaJobInfo == null ? null : replicaJobInfo!.toJson(),
      };
}

class BackupCopyJobInfo {
  BackupCopyJobInfo({
    this.includes,
    this.linkedJobIncludes,
    this.advancedStorageOptions,
    this.linkedBackupIncludes,
  });

  BackupCopyJobInfoIncludes? includes;
  LinkedJobIncludes? linkedJobIncludes;
  BackupCopyJobInfoAdvancedStorageOptions? advancedStorageOptions;
  LinkedBackupIncludes? linkedBackupIncludes;

  factory BackupCopyJobInfo.fromJson(Map<String, dynamic> json) =>
      BackupCopyJobInfo(
        includes: BackupCopyJobInfoIncludes.fromJson(json["Includes"]),
        linkedJobIncludes:
            LinkedJobIncludes.fromJson(json["LinkedJobIncludes"]),
        advancedStorageOptions:
            BackupCopyJobInfoAdvancedStorageOptions.fromJson(
                json["AdvancedStorageOptions"]),
        linkedBackupIncludes:
            LinkedBackupIncludes.fromJson(json["LinkedBackupIncludes"]),
      );

  Map<String, dynamic> toJson() => {
        "Includes": includes!.toJson(),
        "LinkedJobIncludes": linkedJobIncludes!.toJson(),
        "AdvancedStorageOptions": advancedStorageOptions!.toJson(),
        "LinkedBackupIncludes": linkedBackupIncludes!.toJson(),
      };
}

class BackupCopyJobInfoAdvancedStorageOptions {
  BackupCopyJobInfoAdvancedStorageOptions({
    this.passwordKeyId,
  });

  LinkedBackupIncludes? passwordKeyId;

  factory BackupCopyJobInfoAdvancedStorageOptions.fromJson(
          Map<String, dynamic> json) =>
      BackupCopyJobInfoAdvancedStorageOptions(
        passwordKeyId: LinkedBackupIncludes.fromJson(json["PasswordKeyId"]),
      );

  Map<String, dynamic> toJson() => {
        "PasswordKeyId": passwordKeyId!.toJson(),
      };
}

class LinkedBackupIncludes {
  LinkedBackupIncludes();

  factory LinkedBackupIncludes.fromJson(Map<String, dynamic> json) =>
      LinkedBackupIncludes();

  Map<String, dynamic> toJson() => {};
}

class BackupCopyJobInfoIncludes {
  BackupCopyJobInfoIncludes({
    this.objectInJob,
  });

  ObjectInJobElement? objectInJob;

  factory BackupCopyJobInfoIncludes.fromJson(Map<String, dynamic> json) =>
      BackupCopyJobInfoIncludes(
        objectInJob: json["ObjectInJob"] == null
            ? null
            : ObjectInJobElement.fromJson(json["ObjectInJob"]),
      );

  Map<String, dynamic> toJson() => {
        "ObjectInJob": objectInJob == null ? null : objectInJob!.toJson(),
      };
}

class ObjectInJobElement {
  ObjectInJobElement({
    this.href,
    this.type,
    this.objectInJobId,
    this.hierarchyObjRef,
    this.name,
    this.displayName,
    this.order,
    this.guestProcessingOptions,
  });

  String? href;
  ObjectInJobType? type;
  Description? objectInJobId;
  Description? hierarchyObjRef;
  Description? name;
  Description? displayName;
  Description? order;
  ObjectInJobGuestProcessingOptions? guestProcessingOptions;

  factory ObjectInJobElement.fromJson(Map<String, dynamic> json) =>
      ObjectInJobElement(
        href: json["@Href"],
        type: objectInJobTypeValues.map[json["@Type"]],
        objectInJobId: Description.fromJson(json["ObjectInJobId"]),
        hierarchyObjRef: Description.fromJson(json["HierarchyObjRef"]),
        name: Description.fromJson(json["Name"]),
        displayName: Description.fromJson(json["DisplayName"]),
        order: Description.fromJson(json["Order"]),
        guestProcessingOptions: json["GuestProcessingOptions"] == null
            ? null
            : ObjectInJobGuestProcessingOptions.fromJson(
                json["GuestProcessingOptions"]),
      );

  Map<String, dynamic> toJson() => {
        "@Href": href,
        "@Type": objectInJobTypeValues.reverse[type],
        "ObjectInJobId": objectInJobId!.toJson(),
        "HierarchyObjRef": hierarchyObjRef!.toJson(),
        "Name": name!.toJson(),
        "DisplayName": displayName!.toJson(),
        "Order": order!.toJson(),
        "GuestProcessingOptions": guestProcessingOptions == null
            ? null
            : guestProcessingOptions!.toJson(),
      };
}

class ObjectInJobGuestProcessingOptions {
  ObjectInJobGuestProcessingOptions({
    this.vssSnapshotOptions,
    this.windowsGuestFsIndexingOptions,
    this.linuxGuestFsIndexingOptions,
    this.sqlBackupOptions,
    this.windowsCredentialsId,
    this.linuxCredentialsId,
  });

  VssSnapshotOptions? vssSnapshotOptions;
  PurpleGuestFsIndexingOptions? windowsGuestFsIndexingOptions;
  PurpleGuestFsIndexingOptions? linuxGuestFsIndexingOptions;
  SqlBackupOptions? sqlBackupOptions;
  Description? windowsCredentialsId;
  LinkedBackupIncludes? linuxCredentialsId;

  factory ObjectInJobGuestProcessingOptions.fromJson(
          Map<String, dynamic> json) =>
      ObjectInJobGuestProcessingOptions(
        vssSnapshotOptions:
            VssSnapshotOptions.fromJson(json["VssSnapshotOptions"]),
        windowsGuestFsIndexingOptions: PurpleGuestFsIndexingOptions.fromJson(
            json["WindowsGuestFSIndexingOptions"]),
        linuxGuestFsIndexingOptions: PurpleGuestFsIndexingOptions.fromJson(
            json["LinuxGuestFSIndexingOptions"]),
        sqlBackupOptions: SqlBackupOptions.fromJson(json["SqlBackupOptions"]),
        windowsCredentialsId:
            Description.fromJson(json["WindowsCredentialsId"]),
        linuxCredentialsId:
            LinkedBackupIncludes.fromJson(json["LinuxCredentialsId"]),
      );

  Map<String, dynamic> toJson() => {
        "VssSnapshotOptions": vssSnapshotOptions!.toJson(),
        "WindowsGuestFSIndexingOptions":
            windowsGuestFsIndexingOptions!.toJson(),
        "LinuxGuestFSIndexingOptions": linuxGuestFsIndexingOptions!.toJson(),
        "SqlBackupOptions": sqlBackupOptions!.toJson(),
        "WindowsCredentialsId": windowsCredentialsId!.toJson(),
        "LinuxCredentialsId": linuxCredentialsId!.toJson(),
      };
}

class PurpleGuestFsIndexingOptions {
  PurpleGuestFsIndexingOptions({
    this.fileSystemIndexingMode,
    this.includedIndexingFolders,
    this.excludedIndexingFolders,
  });

  Description? fileSystemIndexingMode;
  LinkedBackupIncludes? includedIndexingFolders;
  ExcludedIndexingFolders? excludedIndexingFolders;

  factory PurpleGuestFsIndexingOptions.fromJson(Map<String, dynamic> json) =>
      PurpleGuestFsIndexingOptions(
        fileSystemIndexingMode:
            Description.fromJson(json["FileSystemIndexingMode"]),
        includedIndexingFolders:
            LinkedBackupIncludes.fromJson(json["IncludedIndexingFolders"]),
        excludedIndexingFolders:
            ExcludedIndexingFolders.fromJson(json["ExcludedIndexingFolders"]),
      );

  Map<String, dynamic> toJson() => {
        "FileSystemIndexingMode": fileSystemIndexingMode!.toJson(),
        "IncludedIndexingFolders": includedIndexingFolders!.toJson(),
        "ExcludedIndexingFolders": excludedIndexingFolders!.toJson(),
      };
}

class ExcludedIndexingFolders {
  ExcludedIndexingFolders({
    this.path,
  });

  List<Description>? path;

  factory ExcludedIndexingFolders.fromJson(Map<String, dynamic> json) =>
      ExcludedIndexingFolders(
        path: List<Description>.from(
            json["Path"].map((x) => Description.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Path": List<dynamic>.from(path!.map((x) => x.toJson())),
      };
}

class SqlBackupOptions {
  SqlBackupOptions({
    this.transactionLogsProcessing,
    this.backupLogsFrequencyMin,
    this.useDbBackupRetention,
    this.retainDays,
  });

  Description? transactionLogsProcessing;
  Description? backupLogsFrequencyMin;
  Description? useDbBackupRetention;
  Description? retainDays;

  factory SqlBackupOptions.fromJson(Map<String, dynamic> json) =>
      SqlBackupOptions(
        transactionLogsProcessing:
            Description.fromJson(json["TransactionLogsProcessing"]),
        backupLogsFrequencyMin:
            Description.fromJson(json["BackupLogsFrequencyMin"]),
        useDbBackupRetention:
            Description.fromJson(json["UseDbBackupRetention"]),
        retainDays: Description.fromJson(json["RetainDays"]),
      );

  Map<String, dynamic> toJson() => {
        "TransactionLogsProcessing": transactionLogsProcessing!.toJson(),
        "BackupLogsFrequencyMin": backupLogsFrequencyMin!.toJson(),
        "UseDbBackupRetention": useDbBackupRetention!.toJson(),
        "RetainDays": retainDays!.toJson(),
      };
}

class VssSnapshotOptions {
  VssSnapshotOptions({
    this.vssSnapshotMode,
    this.isCopyOnly,
  });

  Description? vssSnapshotMode;
  Description? isCopyOnly;

  factory VssSnapshotOptions.fromJson(Map<String, dynamic> json) =>
      VssSnapshotOptions(
        vssSnapshotMode: Description.fromJson(json["VssSnapshotMode"]),
        isCopyOnly: Description.fromJson(json["IsCopyOnly"]),
      );

  Map<String, dynamic> toJson() => {
        "VssSnapshotMode": vssSnapshotMode!.toJson(),
        "IsCopyOnly": isCopyOnly!.toJson(),
      };
}

enum ObjectInJobType {
  OBJECT_IN_JOB,
  BACKUP_SERVER_REFERENCE,
  JOB_REFERENCE,
  OBJECT_IN_JOB_LIST,
  BACKUP_JOB_SESSION_REFERENCE_LIST,
  REPLICA_JOB_SESSION_REFERENCE_LIST
}

final objectInJobTypeValues = EnumValues({
  "BackupJobSessionReferenceList":
      ObjectInJobType.BACKUP_JOB_SESSION_REFERENCE_LIST,
  "BackupServerReference": ObjectInJobType.BACKUP_SERVER_REFERENCE,
  "JobReference": ObjectInJobType.JOB_REFERENCE,
  "ObjectInJob": ObjectInJobType.OBJECT_IN_JOB,
  "ObjectInJobList": ObjectInJobType.OBJECT_IN_JOB_LIST,
  "ReplicaJobSessionReferenceList":
      ObjectInJobType.REPLICA_JOB_SESSION_REFERENCE_LIST
});

class LinkedJobIncludes {
  LinkedJobIncludes({
    this.linkedJobObject,
  });

  LinkedJobObject? linkedJobObject;

  factory LinkedJobIncludes.fromJson(Map<String, dynamic> json) =>
      LinkedJobIncludes(
        linkedJobObject: json["LinkedJobObject"] == null
            ? null
            : LinkedJobObject.fromJson(json["LinkedJobObject"]),
      );

  Map<String, dynamic> toJson() => {
        "LinkedJobObject":
            linkedJobObject == null ? null : linkedJobObject!.toJson(),
      };
}

class LinkedJobObject {
  LinkedJobObject({
    this.href,
    this.type,
    this.objectInJobId,
    this.linkedJobUid,
    this.order,
  });

  String? href;
  String? type;
  Description? objectInJobId;
  Description? linkedJobUid;
  Description? order;

  factory LinkedJobObject.fromJson(Map<String, dynamic> json) =>
      LinkedJobObject(
        href: json["@Href"],
        type: json["@Type"],
        objectInJobId: Description.fromJson(json["ObjectInJobId"]),
        linkedJobUid: Description.fromJson(json["LinkedJobUid"]),
        order: Description.fromJson(json["Order"]),
      );

  Map<String, dynamic> toJson() => {
        "@Href": href,
        "@Type": type,
        "ObjectInJobId": objectInJobId!.toJson(),
        "LinkedJobUid": linkedJobUid!.toJson(),
        "Order": order!.toJson(),
      };
}

class BackupJobInfo {
  BackupJobInfo({
    this.includes,
    this.guestProcessingOptions,
    this.advancedStorageOptions,
    this.gfsRetentionPolicy,
    this.simpleRetentionPolicy,
  });

  BackupJobInfoIncludes? includes;
  BackupJobInfoGuestProcessingOptions? guestProcessingOptions;
  BackupJobInfoAdvancedStorageOptions? advancedStorageOptions;
  GfsRetentionPolicy? gfsRetentionPolicy;
  SimpleRetentionPolicy? simpleRetentionPolicy;

  factory BackupJobInfo.fromJson(Map<String, dynamic> json) => BackupJobInfo(
        includes: BackupJobInfoIncludes.fromJson(json["Includes"]),
        guestProcessingOptions: BackupJobInfoGuestProcessingOptions.fromJson(
            json["GuestProcessingOptions"]),
        advancedStorageOptions: BackupJobInfoAdvancedStorageOptions.fromJson(
            json["AdvancedStorageOptions"]),
        gfsRetentionPolicy:
            GfsRetentionPolicy.fromJson(json["GfsRetentionPolicy"]),
        simpleRetentionPolicy:
            SimpleRetentionPolicy.fromJson(json["SimpleRetentionPolicy"]),
      );

  Map<String, dynamic> toJson() => {
        "Includes": includes!.toJson(),
        "GuestProcessingOptions": guestProcessingOptions!.toJson(),
        "AdvancedStorageOptions": advancedStorageOptions!.toJson(),
        "GfsRetentionPolicy": gfsRetentionPolicy!.toJson(),
        "SimpleRetentionPolicy": simpleRetentionPolicy!.toJson(),
      };
}

class BackupJobInfoAdvancedStorageOptions {
  BackupJobInfoAdvancedStorageOptions({
    this.passwordKeyId,
  });

  Description? passwordKeyId;

  factory BackupJobInfoAdvancedStorageOptions.fromJson(
          Map<String, dynamic> json) =>
      BackupJobInfoAdvancedStorageOptions(
        passwordKeyId: Description.fromJson(json["PasswordKeyId"]),
      );

  Map<String, dynamic> toJson() => {
        "PasswordKeyId": passwordKeyId!.toJson(),
      };
}

class GfsRetentionPolicy {
  GfsRetentionPolicy({
    this.enabled,
    this.weekly,
    this.monthly,
    this.yearly,
  });

  String? enabled;
  Weekly? weekly;
  Monthly? monthly;
  Yearly? yearly;

  factory GfsRetentionPolicy.fromJson(Map<String, dynamic> json) =>
      GfsRetentionPolicy(
        enabled: json["@Enabled"],
        weekly: Weekly.fromJson(json["Weekly"]),
        monthly: Monthly.fromJson(json["Monthly"]),
        yearly: Yearly.fromJson(json["Yearly"]),
      );

  Map<String, dynamic> toJson() => {
        "@Enabled": enabled,
        "Weekly": weekly!.toJson(),
        "Monthly": monthly!.toJson(),
        "Yearly": yearly!.toJson(),
      };
}

class Monthly {
  Monthly({
    this.enabled,
    this.retentionPeriod,
    this.selectedWeek,
  });

  Description? enabled;
  Description? retentionPeriod;
  Description? selectedWeek;

  factory Monthly.fromJson(Map<String, dynamic> json) => Monthly(
        enabled: Description.fromJson(json["Enabled"]),
        retentionPeriod: Description.fromJson(json["RetentionPeriod"]),
        selectedWeek: Description.fromJson(json["SelectedWeek"]),
      );

  Map<String, dynamic> toJson() => {
        "Enabled": enabled!.toJson(),
        "RetentionPeriod": retentionPeriod!.toJson(),
        "SelectedWeek": selectedWeek!.toJson(),
      };
}

class Weekly {
  Weekly({
    this.enabled,
    this.retentionPeriod,
    this.selectedDay,
  });

  Description? enabled;
  Description? retentionPeriod;
  Description? selectedDay;

  factory Weekly.fromJson(Map<String, dynamic> json) => Weekly(
        enabled: Description.fromJson(json["Enabled"]),
        retentionPeriod: Description.fromJson(json["RetentionPeriod"]),
        selectedDay: Description.fromJson(json["SelectedDay"]),
      );

  Map<String, dynamic> toJson() => {
        "Enabled": enabled!.toJson(),
        "RetentionPeriod": retentionPeriod!.toJson(),
        "SelectedDay": selectedDay!.toJson(),
      };
}

class Yearly {
  Yearly({
    this.enabled,
    this.retentionPeriod,
    this.selectedMonth,
  });

  Description? enabled;
  Description? retentionPeriod;
  Description? selectedMonth;

  factory Yearly.fromJson(Map<String, dynamic> json) => Yearly(
        enabled: Description.fromJson(json["Enabled"]),
        retentionPeriod: Description.fromJson(json["RetentionPeriod"]),
        selectedMonth: Description.fromJson(json["SelectedMonth"]),
      );

  Map<String, dynamic> toJson() => {
        "Enabled": enabled!.toJson(),
        "RetentionPeriod": retentionPeriod!.toJson(),
        "SelectedMonth": selectedMonth!.toJson(),
      };
}

class BackupJobInfoGuestProcessingOptions {
  BackupJobInfoGuestProcessingOptions({
    this.vssSnapshotOptions,
    this.windowsGuestFsIndexingOptions,
    this.linuxGuestFsIndexingOptions,
    this.sqlBackupOptions,
    this.windowsCredentialsId,
    this.linuxCredentialsId,
  });

  VssSnapshotOptions? vssSnapshotOptions;
  FluffyGuestFsIndexingOptions? windowsGuestFsIndexingOptions;
  FluffyGuestFsIndexingOptions? linuxGuestFsIndexingOptions;
  SqlBackupOptions? sqlBackupOptions;
  Description? windowsCredentialsId;
  Description? linuxCredentialsId;

  factory BackupJobInfoGuestProcessingOptions.fromJson(
          Map<String, dynamic> json) =>
      BackupJobInfoGuestProcessingOptions(
        vssSnapshotOptions:
            VssSnapshotOptions.fromJson(json["VssSnapshotOptions"]),
        windowsGuestFsIndexingOptions: FluffyGuestFsIndexingOptions.fromJson(
            json["WindowsGuestFSIndexingOptions"]),
        linuxGuestFsIndexingOptions: FluffyGuestFsIndexingOptions.fromJson(
            json["LinuxGuestFSIndexingOptions"]),
        sqlBackupOptions: SqlBackupOptions.fromJson(json["SqlBackupOptions"]),
        windowsCredentialsId:
            Description.fromJson(json["WindowsCredentialsId"]),
        linuxCredentialsId: Description.fromJson(json["LinuxCredentialsId"]),
      );

  Map<String, dynamic> toJson() => {
        "VssSnapshotOptions": vssSnapshotOptions!.toJson(),
        "WindowsGuestFSIndexingOptions":
            windowsGuestFsIndexingOptions!.toJson(),
        "LinuxGuestFSIndexingOptions": linuxGuestFsIndexingOptions!.toJson(),
        "SqlBackupOptions": sqlBackupOptions!.toJson(),
        "WindowsCredentialsId": windowsCredentialsId!.toJson(),
        "LinuxCredentialsId": linuxCredentialsId!.toJson(),
      };
}

class FluffyGuestFsIndexingOptions {
  FluffyGuestFsIndexingOptions({
    this.fileSystemIndexingMode,
    this.includedIndexingFolders,
    this.excludedIndexingFolders,
  });

  Description? fileSystemIndexingMode;
  LinkedBackupIncludes? includedIndexingFolders;
  LinkedBackupIncludes? excludedIndexingFolders;

  factory FluffyGuestFsIndexingOptions.fromJson(Map<String, dynamic> json) =>
      FluffyGuestFsIndexingOptions(
        fileSystemIndexingMode:
            Description.fromJson(json["FileSystemIndexingMode"]),
        includedIndexingFolders:
            LinkedBackupIncludes.fromJson(json["IncludedIndexingFolders"]),
        excludedIndexingFolders:
            LinkedBackupIncludes.fromJson(json["ExcludedIndexingFolders"]),
      );

  Map<String, dynamic> toJson() => {
        "FileSystemIndexingMode": fileSystemIndexingMode!.toJson(),
        "IncludedIndexingFolders": includedIndexingFolders!.toJson(),
        "ExcludedIndexingFolders": excludedIndexingFolders!.toJson(),
      };
}

class BackupJobInfoIncludes {
  BackupJobInfoIncludes({
    this.objectInJob,
  });

  dynamic objectInJob;

  factory BackupJobInfoIncludes.fromJson(Map<String, dynamic> json) =>
      BackupJobInfoIncludes(
        objectInJob: json["ObjectInJob"],
      );

  Map<String, dynamic> toJson() => {
        "ObjectInJob": objectInJob,
      };
}

class SimpleRetentionPolicy {
  SimpleRetentionPolicy({
    this.retainCycles,
    this.retainDaysToKeep,
    this.retainLimitType,
  });

  Description? retainCycles;
  Description? retainDaysToKeep;
  Description? retainLimitType;

  factory SimpleRetentionPolicy.fromJson(Map<String, dynamic> json) =>
      SimpleRetentionPolicy(
        retainCycles: Description.fromJson(json["RetainCycles"]),
        retainDaysToKeep: Description.fromJson(json["RetainDaysToKeep"]),
        retainLimitType: Description.fromJson(json["RetainLimitType"]),
      );

  Map<String, dynamic> toJson() => {
        "RetainCycles": retainCycles!.toJson(),
        "RetainDaysToKeep": retainDaysToKeep!.toJson(),
        "RetainLimitType": retainLimitType!.toJson(),
      };
}

class ImmediateBackupCopyJobInfo {
  ImmediateBackupCopyJobInfo({
    this.linkedJobIncludes,
  });

  LinkedJobIncludes? linkedJobIncludes;

  factory ImmediateBackupCopyJobInfo.fromJson(Map<String, dynamic> json) =>
      ImmediateBackupCopyJobInfo(
        linkedJobIncludes:
            LinkedJobIncludes.fromJson(json["LinkedJobIncludes"]),
      );

  Map<String, dynamic> toJson() => {
        "LinkedJobIncludes": linkedJobIncludes!.toJson(),
      };
}

class ReplicaJobInfo {
  ReplicaJobInfo({
    this.includes,
    this.guestProcessingOptions,
  });

  BackupCopyJobInfoIncludes? includes;
  ReplicaJobInfoGuestProcessingOptions? guestProcessingOptions;

  factory ReplicaJobInfo.fromJson(Map<String, dynamic> json) => ReplicaJobInfo(
        includes: BackupCopyJobInfoIncludes.fromJson(json["Includes"]),
        guestProcessingOptions: ReplicaJobInfoGuestProcessingOptions.fromJson(
            json["GuestProcessingOptions"]),
      );

  Map<String, dynamic> toJson() => {
        "Includes": includes!.toJson(),
        "GuestProcessingOptions": guestProcessingOptions!.toJson(),
      };
}

class ReplicaJobInfoGuestProcessingOptions {
  ReplicaJobInfoGuestProcessingOptions({
    this.vssSnapshotOptions,
    this.windowsGuestFsIndexingOptions,
    this.linuxGuestFsIndexingOptions,
    this.sqlBackupOptions,
    this.windowsCredentialsId,
    this.linuxCredentialsId,
  });

  VssSnapshotOptions? vssSnapshotOptions;
  FluffyGuestFsIndexingOptions? windowsGuestFsIndexingOptions;
  FluffyGuestFsIndexingOptions? linuxGuestFsIndexingOptions;
  SqlBackupOptions? sqlBackupOptions;
  LinkedBackupIncludes? windowsCredentialsId;
  LinkedBackupIncludes? linuxCredentialsId;

  factory ReplicaJobInfoGuestProcessingOptions.fromJson(
          Map<String, dynamic> json) =>
      ReplicaJobInfoGuestProcessingOptions(
        vssSnapshotOptions:
            VssSnapshotOptions.fromJson(json["VssSnapshotOptions"]),
        windowsGuestFsIndexingOptions: FluffyGuestFsIndexingOptions.fromJson(
            json["WindowsGuestFSIndexingOptions"]),
        linuxGuestFsIndexingOptions: FluffyGuestFsIndexingOptions.fromJson(
            json["LinuxGuestFSIndexingOptions"]),
        sqlBackupOptions: SqlBackupOptions.fromJson(json["SqlBackupOptions"]),
        windowsCredentialsId:
            LinkedBackupIncludes.fromJson(json["WindowsCredentialsId"]),
        linuxCredentialsId:
            LinkedBackupIncludes.fromJson(json["LinuxCredentialsId"]),
      );

  Map<String, dynamic> toJson() => {
        "VssSnapshotOptions": vssSnapshotOptions!.toJson(),
        "WindowsGuestFSIndexingOptions":
            windowsGuestFsIndexingOptions!.toJson(),
        "LinuxGuestFSIndexingOptions": linuxGuestFsIndexingOptions!.toJson(),
        "SqlBackupOptions": sqlBackupOptions!.toJson(),
        "WindowsCredentialsId": windowsCredentialsId!.toJson(),
        "LinuxCredentialsId": linuxCredentialsId!.toJson(),
      };
}

class JobScheduleOptions {
  JobScheduleOptions({
    this.standart,
    this.immediateCopyMode,
  });

  Standart? standart;
  ImmediateCopyMode? immediateCopyMode;

  factory JobScheduleOptions.fromJson(Map<String, dynamic> json) =>
      JobScheduleOptions(
        standart: json["Standart"] == null
            ? null
            : Standart.fromJson(json["Standart"]),
        immediateCopyMode: json["ImmediateCopyMode"] == null
            ? null
            : ImmediateCopyMode.fromJson(json["ImmediateCopyMode"]),
      );

  Map<String, dynamic> toJson() => {
        "Standart": standart == null ? null : standart!.toJson(),
        "ImmediateCopyMode":
            immediateCopyMode == null ? null : immediateCopyMode!.toJson(),
      };
}

class ImmediateCopyMode {
  ImmediateCopyMode({
    this.optionsContinuous,
  });

  OptionsContinuous? optionsContinuous;

  factory ImmediateCopyMode.fromJson(Map<String, dynamic> json) =>
      ImmediateCopyMode(
        optionsContinuous:
            OptionsContinuous.fromJson(json["OptionsContinuous"]),
      );

  Map<String, dynamic> toJson() => {
        "OptionsContinuous": optionsContinuous!.toJson(),
      };
}

class OptionsContinuous {
  OptionsContinuous({
    this.enabled,
    this.schedule,
  });

  String? enabled;
  Schedule? schedule;

  factory OptionsContinuous.fromJson(Map<String, dynamic> json) =>
      OptionsContinuous(
        enabled: json["@Enabled"],
        schedule: Schedule.fromJson(json["Schedule"]),
      );

  Map<String, dynamic> toJson() => {
        "@Enabled": enabled,
        "Schedule": schedule!.toJson(),
      };
}

class Schedule {
  Schedule({
    this.day,
  });

  List<Day>? day;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        day: List<Day>.from(json["Day"].map((x) => Day.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Day": List<dynamic>.from(day!.map((x) => x.toJson())),
      };
}

class Day {
  Day({
    this.name,
    this.empty,
  });

  Name? name;
  Empty? empty;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        name: nameValues.map[json["@Name"]],
        empty: emptyValues.map[json["\u0024"]],
      );

  Map<String, dynamic> toJson() => {
        "@Name": nameValues.reverse[name],
        "\u0024": emptyValues.reverse[empty],
      };
}

enum Empty {
  THE_111111111111111111111111,
  THE_000000000000000000000000,
  THE_000000001111111111111000
}

final emptyValues = EnumValues({
  "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0":
      Empty.THE_000000000000000000000000,
  "0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0":
      Empty.THE_000000001111111111111000,
  "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1":
      Empty.THE_111111111111111111111111
});

enum Name { SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY }

final nameValues = EnumValues({
  "Friday": Name.FRIDAY,
  "Monday": Name.MONDAY,
  "Saturday": Name.SATURDAY,
  "Sunday": Name.SUNDAY,
  "Thursday": Name.THURSDAY,
  "Tuesday": Name.TUESDAY,
  "Wednesday": Name.WEDNESDAY
});

class Standart {
  Standart({
    this.retryOptions,
    this.waitForBackupCompletion,
    this.backupCompetitionWaitingPeriodMin,
    this.optionsDaily,
    this.optionsMonthly,
    this.optionsPeriodically,
    this.optionsContinuous,
    this.optionsBackupWindow,
    this.optionsDaisyChaining,
  });

  RetryOptions? retryOptions;
  Description? waitForBackupCompletion;
  Description? backupCompetitionWaitingPeriodMin;
  OptionsDaily? optionsDaily;
  OptionsMonthly? optionsMonthly;
  OptionsPeriodically? optionsPeriodically;
  OptionsContinuous? optionsContinuous;
  OptionsBackupWindow? optionsBackupWindow;
  OptionsDaisyChaining? optionsDaisyChaining;

  factory Standart.fromJson(Map<String, dynamic> json) => Standart(
        retryOptions: RetryOptions.fromJson(json["RetryOptions"]),
        waitForBackupCompletion:
            Description.fromJson(json["WaitForBackupCompletion"]),
        backupCompetitionWaitingPeriodMin:
            Description.fromJson(json["BackupCompetitionWaitingPeriodMin"]),
        optionsDaily: json["OptionsDaily"] == null
            ? null
            : OptionsDaily.fromJson(json["OptionsDaily"]),
        optionsMonthly: json["OptionsMonthly"] == null
            ? null
            : OptionsMonthly.fromJson(json["OptionsMonthly"]),
        optionsPeriodically:
            OptionsPeriodically.fromJson(json["OptionsPeriodically"]),
        optionsContinuous:
            OptionsContinuous.fromJson(json["OptionsContinuous"]),
        optionsBackupWindow: json["OptionsBackupWindow"] == null
            ? null
            : OptionsBackupWindow.fromJson(json["OptionsBackupWindow"]),
        optionsDaisyChaining:
            OptionsDaisyChaining.fromJson(json["OptionsDaisyChaining"]),
      );

  Map<String, dynamic> toJson() => {
        "RetryOptions": retryOptions!.toJson(),
        "WaitForBackupCompletion": waitForBackupCompletion!.toJson(),
        "BackupCompetitionWaitingPeriodMin":
            backupCompetitionWaitingPeriodMin!.toJson(),
        "OptionsDaily": optionsDaily == null ? null : optionsDaily!.toJson(),
        "OptionsMonthly":
            optionsMonthly == null ? null : optionsMonthly!.toJson(),
        "OptionsPeriodically": optionsPeriodically!.toJson(),
        "OptionsContinuous": optionsContinuous!.toJson(),
        "OptionsBackupWindow":
            optionsBackupWindow == null ? null : optionsBackupWindow!.toJson(),
        "OptionsDaisyChaining": optionsDaisyChaining!.toJson(),
      };
}

class OptionsBackupWindow {
  OptionsBackupWindow({
    this.enabled,
    this.timePeriods,
  });

  String? enabled;
  Schedule? timePeriods;

  factory OptionsBackupWindow.fromJson(Map<String, dynamic> json) =>
      OptionsBackupWindow(
        enabled: json["@Enabled"],
        timePeriods: Schedule.fromJson(json["TimePeriods"]),
      );

  Map<String, dynamic> toJson() => {
        "@Enabled": enabled,
        "TimePeriods": timePeriods!.toJson(),
      };
}

class OptionsDaily {
  OptionsDaily({
    this.enabled,
    this.kind,
    this.days,
    this.time,
    this.timeOffsetUtc,
  });

  String? enabled;
  Description? kind;
  List<Description>? days;
  Description? time;
  Description? timeOffsetUtc;

  factory OptionsDaily.fromJson(Map<String, dynamic> json) => OptionsDaily(
        enabled: json["@Enabled"],
        kind: Description.fromJson(json["Kind"]),
        days: List<Description>.from(
            json["Days"].map((x) => Description.fromJson(x))),
        time: Description.fromJson(json["Time"]),
        timeOffsetUtc: Description.fromJson(json["TimeOffsetUtc"]),
      );

  Map<String, dynamic> toJson() => {
        "@Enabled": enabled,
        "Kind": kind!.toJson(),
        "Days": List<dynamic>.from(days!.map((x) => x.toJson())),
        "Time": time!.toJson(),
        "TimeOffsetUtc": timeOffsetUtc!.toJson(),
      };
}

class OptionsDaisyChaining {
  OptionsDaisyChaining({
    this.enabled,
    this.previousJobUid,
  });

  String? enabled;
  Description? previousJobUid;

  factory OptionsDaisyChaining.fromJson(Map<String, dynamic> json) =>
      OptionsDaisyChaining(
        enabled: json["@Enabled"],
        previousJobUid: Description.fromJson(json["PreviousJobUid"]),
      );

  Map<String, dynamic> toJson() => {
        "@Enabled": enabled,
        "PreviousJobUid": previousJobUid!.toJson(),
      };
}

class OptionsMonthly {
  OptionsMonthly({
    this.enabled,
    this.time,
    this.timeOffsetUtc,
    this.dayNumberInMonth,
    this.dayOfWeek,
    this.months,
    this.dayOfMonth,
  });

  String? enabled;
  Description? time;
  Description? timeOffsetUtc;
  Description? dayNumberInMonth;
  Description? dayOfWeek;
  List<Description>? months;
  Description? dayOfMonth;

  factory OptionsMonthly.fromJson(Map<String, dynamic> json) => OptionsMonthly(
        enabled: json["@Enabled"],
        time: Description.fromJson(json["Time"]),
        timeOffsetUtc: Description.fromJson(json["TimeOffsetUtc"]),
        dayNumberInMonth: Description.fromJson(json["DayNumberInMonth"]),
        dayOfWeek: Description.fromJson(json["DayOfWeek"]),
        months: List<Description>.from(
            json["Months"].map((x) => Description.fromJson(x))),
        dayOfMonth: Description.fromJson(json["DayOfMonth"]),
      );

  Map<String, dynamic> toJson() => {
        "@Enabled": enabled,
        "Time": time!.toJson(),
        "TimeOffsetUtc": timeOffsetUtc!.toJson(),
        "DayNumberInMonth": dayNumberInMonth!.toJson(),
        "DayOfWeek": dayOfWeek!.toJson(),
        "Months": List<dynamic>.from(months!.map((x) => x.toJson())),
        "DayOfMonth": dayOfMonth!.toJson(),
      };
}

class OptionsPeriodically {
  OptionsPeriodically({
    this.enabled,
    this.kind,
    this.fullPeriod,
    this.schedule,
  });

  String? enabled;
  Description? kind;
  Description? fullPeriod;
  Schedule? schedule;

  factory OptionsPeriodically.fromJson(Map<String, dynamic> json) =>
      OptionsPeriodically(
        enabled: json["@Enabled"],
        kind: Description.fromJson(json["Kind"]),
        fullPeriod: Description.fromJson(json["FullPeriod"]),
        schedule: Schedule.fromJson(json["Schedule"]),
      );

  Map<String, dynamic> toJson() => {
        "@Enabled": enabled,
        "Kind": kind!.toJson(),
        "FullPeriod": fullPeriod!.toJson(),
        "Schedule": schedule!.toJson(),
      };
}

class RetryOptions {
  RetryOptions({
    this.retryTimes,
    this.retryTimeout,
    this.retrySpecified,
  });

  Description? retryTimes;
  Description? retryTimeout;
  Description? retrySpecified;

  factory RetryOptions.fromJson(Map<String, dynamic> json) => RetryOptions(
        retryTimes: Description.fromJson(json["RetryTimes"]),
        retryTimeout: Description.fromJson(json["RetryTimeout"]),
        retrySpecified: Description.fromJson(json["RetrySpecified"]),
      );

  Map<String, dynamic> toJson() => {
        "RetryTimes": retryTimes!.toJson(),
        "RetryTimeout": retryTimeout!.toJson(),
        "RetrySpecified": retrySpecified!.toJson(),
      };
}

class Links {
  Links({
    this.link,
  });

  List<Link>? link;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        link: List<Link>.from(json["Link"].map((x) => Link.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Link": List<dynamic>.from(link!.map((x) => x.toJson())),
      };
}

class Link {
  Link({
    this.href,
    this.name,
    this.type,
    this.rel,
  });

  String? href;
  String? name;
  ObjectInJobType? type;
  Rel? rel;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        href: json["@Href"],
        name: json["@Name"] == null ? null : json["@Name"],
        type: json["@Type"] == null
            ? null
            : objectInJobTypeValues.map[json["@Type"]],
        rel: relValues.map[json["@Rel"]],
      );

  Map<String, dynamic> toJson() => {
        "@Href": href,
        "@Name": name == null ? null : name,
        "@Type": type == null ? null : objectInJobTypeValues.reverse[type],
        "@Rel": relValues.reverse[rel],
      };
}

enum Rel {
  UP,
  ALTERNATE,
  EDIT,
  CLONE,
  TOGGLE_SCHEDULE_ENABLED,
  DOWN,
  CREATE,
  START,
  STOP,
  RETRY
}

final relValues = EnumValues({
  "Alternate": Rel.ALTERNATE,
  "Clone": Rel.CLONE,
  "Create": Rel.CREATE,
  "Down": Rel.DOWN,
  "Edit": Rel.EDIT,
  "Retry": Rel.RETRY,
  "Start": Rel.START,
  "Stop": Rel.STOP,
  "ToggleScheduleEnabled": Rel.TOGGLE_SCHEDULE_ENABLED,
  "Up": Rel.UP
});

enum JobType { JOB }

final jobTypeValues = EnumValues({"Job": JobType.JOB});

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

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
