// To parse this JSON data, do
//
//     final initialModel = initialModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    this.logonSession,
  });

  LogonSession? logonSession;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        logonSession: LogonSession.fromJson(json["LogonSession"]),
      );

  Map<String, dynamic> toJson() => {
        "LogonSession": logonSession!.toJson(),
      };
}

class LogonSession {
  LogonSession({
    this.href,
    this.type,
    this.xmlns,
    this.links,
    this.userName,
    this.sessionId,
  });

  String? href;
  String? type;
  List<Xmln>? xmlns;
  Links? links;
  SessionId? userName;
  SessionId? sessionId;

  factory LogonSession.fromJson(Map<String, dynamic> json) => LogonSession(
        href: json["@Href"],
        type: json["@Type"],
        xmlns: List<Xmln>.from(json["@xmlns"].map((x) => Xmln.fromJson(x))),
        links: Links.fromJson(json["Links"]),
        userName: SessionId.fromJson(json["UserName"]),
        sessionId: SessionId.fromJson(json["SessionId"]),
      );

  Map<String, dynamic> toJson() => {
        "@Href": href,
        "@Type": type,
        "@xmlns": List<dynamic>.from(xmlns!.map((x) => x.toJson())),
        "Links": links!.toJson(),
        "UserName": userName!.toJson(),
        "SessionId": sessionId!.toJson(),
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
    this.type,
    this.rel,
    this.name,
  });

  String? href;
  String? type;
  Rel? rel;
  String? name;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        href: json["@Href"],
        type: json["@Type"] ?? null,
        rel: relValues.map[json["@Rel"]],
        name: json["@Name"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "@Href": href,
        "@Type": type ?? null,
        "@Rel": relValues.reverse[rel],
        "@Name": name ?? null,
      };
}

enum Rel { UP, DOWN, CREATE, DELETE }

final relValues = EnumValues({
  "Create": Rel.CREATE,
  "Delete": Rel.DELETE,
  "Down": Rel.DOWN,
  "Up": Rel.UP
});

class SessionId {
  SessionId({
    this.id,
  });

  String? id;

  factory SessionId.fromJson(Map<String, dynamic> json) => SessionId(
        id: json["\u0024"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024": id,
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
        xsd: json["xsd"] ?? null,
        xsi: json["xsi"] ?? null,
        empty: json["\u0024"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "xsd": xsd ?? null,
        "xsi": xsi ?? null,
        "\u0024": empty ?? null,
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
