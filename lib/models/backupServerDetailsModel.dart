// To parse this JSON data, do
//
//     final backupServersDetailsModel = backupServersDetailsModelFromJson(jsonString);

import 'dart:convert';

BackupServersDetailsModel backupServersDetailsModelFromJson(String str) =>
    BackupServersDetailsModel.fromJson(json.decode(str));

String backupServersDetailsModelToJson(BackupServersDetailsModel data) =>
    json.encode(data.toJson());

class BackupServersDetailsModel {
  BackupServersDetailsModel({
    this.backupServer,
  });

  BackupServer? backupServer;

  factory BackupServersDetailsModel.fromJson(Map<String, dynamic> json) =>
      BackupServersDetailsModel(
        backupServer: json["BackupServer"] == null
            ? null
            : BackupServer.fromJson(json["BackupServer"]),
      );

  Map<String, dynamic> toJson() => {
        "BackupServer": backupServer == null ? null : backupServer!.toJson(),
      };
}

class BackupServer {
  BackupServer({
    this.href,
    this.type,
    this.name,
    this.uid,
    this.xmlns,
    this.links,
    this.description,
    this.port,
    this.version,
  });

  String? href;
  String? type;
  String? name;
  String? uid;
  List<Xmln>? xmlns;
  Links? links;
  Description? description;
  Port? port;
  Port? version;

  factory BackupServer.fromJson(Map<String, dynamic> json) => BackupServer(
        href: json["@Href"] == null ? null : json["@Href"],
        type: json["@Type"] == null ? null : json["@Type"],
        name: json["@Name"] == null ? null : json["@Name"],
        uid: json["@UID"] == null ? null : json["@UID"],
        xmlns: json["@xmlns"] == null
            ? null
            : List<Xmln>.from(json["@xmlns"].map((x) => Xmln.fromJson(x))),
        links: json["Links"] == null ? null : Links.fromJson(json["Links"]),
        description: json["Description"] == null
            ? null
            : Description.fromJson(json["Description"]),
        port: json["Port"] == null ? null : Port.fromJson(json["Port"]),
        version:
            json["Version"] == null ? null : Port.fromJson(json["Version"]),
      );

  Map<String, dynamic> toJson() => {
        "@Href": href == null ? null : href,
        "@Type": type == null ? null : type,
        "@Name": name == null ? null : name,
        "@UID": uid == null ? null : uid,
        "@xmlns": xmlns == null
            ? null
            : List<dynamic>.from(xmlns!.map((x) => x.toJson())),
        "Links": links == null ? null : links!.toJson(),
        "Description": description == null ? null : description!.toJson(),
        "Port": port == null ? null : port!.toJson(),
        "Version": version == null ? null : version!.toJson(),
      };
}

class Description {
  Description({
    this.empty,
  });
  String? empty;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        empty: json["\u0024"] == null ? null : json["\u0024"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024": empty == null ? null : empty,
      };
}

class Links {
  Links({
    this.link,
  });

  List<Link>? link;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        link: json["Link"] == null
            ? null
            : List<Link>.from(json["Link"].map((x) => Link.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Link": link == null
            ? null
            : List<dynamic>.from(link!.map((x) => x.toJson())),
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
  String? type;
  String? rel;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        href: json["@Href"] == null ? null : json["@Href"],
        name: json["@Name"] == null ? null : json["@Name"],
        type: json["@Type"] == null ? null : json["@Type"],
        rel: json["@Rel"] == null ? null : json["@Rel"],
      );

  Map<String, dynamic> toJson() => {
        "@Href": href == null ? null : href,
        "@Name": name == null ? null : name,
        "@Type": type == null ? null : type,
        "@Rel": rel == null ? null : rel,
      };
}

class Port {
  Port({
    this.empty,
  });

  String? empty;

  factory Port.fromJson(Map<String, dynamic> json) => Port(
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
