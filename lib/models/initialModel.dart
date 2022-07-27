// To parse this JSON data, do
//
//     final initialModel = initialModelFromJson(jsonString);

import 'dart:convert';

InitialModel initialModelFromJson(String str) =>
    InitialModel.fromJson(json.decode(str));

String initialModelToJson(InitialModel data) => json.encode(data.toJson());

class InitialModel {
  InitialModel({
    this.enterpriseManager,
  });

  EnterpriseManager? enterpriseManager;

  factory InitialModel.fromJson(Map<String, dynamic> json) => InitialModel(
        enterpriseManager:
            EnterpriseManager.fromJson(json["EnterpriseManager"]),
      );

  Map<String, dynamic> toJson() => {
        "EnterpriseManager": enterpriseManager!.toJson(),
      };
}

class EnterpriseManager {
  EnterpriseManager({
    this.xmlns,
    this.links,
    this.supportedVersions,
  });

  List<Xmln>? xmlns;
  EnterpriseManagerLinks? links;
  SupportedVersions? supportedVersions;

  factory EnterpriseManager.fromJson(Map<String, dynamic> json) =>
      EnterpriseManager(
        xmlns: List<Xmln>.from(json["@xmlns"].map((x) => Xmln.fromJson(x))),
        links: EnterpriseManagerLinks.fromJson(json["Links"]),
        supportedVersions:
            SupportedVersions.fromJson(json["SupportedVersions"]),
      );

  Map<String, dynamic> toJson() => {
        "@xmlns": List<dynamic>.from(xmlns!.map((x) => x.toJson())),
        "Links": links!.toJson(),
        "SupportedVersions": supportedVersions!.toJson(),
      };
}

class EnterpriseManagerLinks {
  EnterpriseManagerLinks({
    this.link,
  });

  List<Link>? link;

  factory EnterpriseManagerLinks.fromJson(Map<String, dynamic> json) =>
      EnterpriseManagerLinks(
        link: List<Link>.from(json["Link"].map((x) => Link.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Link": List<dynamic>.from(link!.map((x) => x.toJson())),
      };
}

class Link {
  Link({
    this.href,
    this.type,
    this.rel,
  });

  String? href;
  String? type;
  String? rel;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        href: json["@Href"],
        type: json["@Type"],
        rel: json["@Rel"],
      );

  Map<String, dynamic> toJson() => {
        "@Href": href,
        "@Type": type,
        "@Rel": rel,
      };
}

class SupportedVersions {
  SupportedVersions({
    this.supportedVersion,
  });

  List<SupportedVersion>? supportedVersion;

  factory SupportedVersions.fromJson(Map<String, dynamic> json) =>
      SupportedVersions(
        supportedVersion: List<SupportedVersion>.from(
            json["SupportedVersion"].map((x) => SupportedVersion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "SupportedVersion":
            List<dynamic>.from(supportedVersion!.map((x) => x.toJson())),
      };
}

class SupportedVersion {
  SupportedVersion({
    this.name,
    this.links,
  });

  String? name;
  SupportedVersionLinks? links;

  factory SupportedVersion.fromJson(Map<String, dynamic> json) =>
      SupportedVersion(
        name: json["@Name"],
        links: SupportedVersionLinks.fromJson(json["Links"]),
      );

  Map<String, dynamic> toJson() => {
        "@Name": name,
        "Links": links!.toJson(),
      };
}

class SupportedVersionLinks {
  SupportedVersionLinks({
    this.link,
  });

  Link? link;

  factory SupportedVersionLinks.fromJson(Map<String, dynamic> json) =>
      SupportedVersionLinks(
        link: Link.fromJson(json["Link"]),
      );

  Map<String, dynamic> toJson() => {
        "Link": link!.toJson(),
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
