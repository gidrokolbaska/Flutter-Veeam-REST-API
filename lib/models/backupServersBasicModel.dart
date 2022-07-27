// To parse this JSON data, do
//
//     final backupServersBasicModel = backupServersBasicModelFromJson(jsonString);

import 'dart:convert';

BackupServersBasicModel backupServersBasicModelFromJson(String str) =>
    BackupServersBasicModel.fromJson(json.decode(str));

String backupServersBasicModelToJson(BackupServersBasicModel data) =>
    json.encode(data.toJson());

class BackupServersBasicModel {
  BackupServersBasicModel({
    this.entityReferences,
  });

  EntityReferences? entityReferences;

  factory BackupServersBasicModel.fromJson(Map<String, dynamic> json) =>
      BackupServersBasicModel(
        entityReferences: json["EntityReferences"] == null
            ? null
            : EntityReferences.fromJson(json["EntityReferences"]),
      );

  Map<String, dynamic> toJson() => {
        "EntityReferences":
            entityReferences == null ? null : entityReferences!.toJson(),
      };
}

class EntityReferences {
  EntityReferences({
    this.xmlns,
    this.ref,
  });

  List<Xmln>? xmlns;
  List<Ref>? ref;

  factory EntityReferences.fromJson(Map<String, dynamic> json) =>
      EntityReferences(
        xmlns: json["@xmlns"] == null
            ? null
            : List<Xmln>.from(json["@xmlns"].map((x) => Xmln.fromJson(x))),
        ref: json["Ref"] == null
            ? null
            : json["Ref"] is List<Ref>
                ? List<Ref>.from(json["Ref"].map((x) => Ref.fromJson(x)))
                : List<Ref>.generate(1, (index) => Ref.fromJson(json["Ref"])),
      );

  Map<String, dynamic> toJson() => {
        "@xmlns": xmlns == null
            ? null
            : List<dynamic>.from(xmlns!.map((x) => x.toJson())),
        "Ref": ref == null
            ? null
            : List<dynamic>.from(ref!.map((x) => x.toJson())),
      };
}

class Ref {
  Ref({
    this.type,
    this.href,
    this.name,
    this.uid,
    this.links,
  });

  String? type;
  String? href;
  String? name;
  String? uid;
  Links? links;

  factory Ref.fromJson(Map<String, dynamic> json) => Ref(
        type: json["@Type"] == null ? null : json["@Type"],
        href: json["@Href"] == null ? null : json["@Href"],
        name: json["@Name"] == null ? null : json["@Name"],
        uid: json["@UID"] == null ? null : json["@UID"],
        links: json["Links"] == null ? null : Links.fromJson(json["Links"]),
      );

  Map<String, dynamic> toJson() => {
        "@Type": type == null ? null : type,
        "@Href": href == null ? null : href,
        "@Name": name == null ? null : name,
        "@UID": uid == null ? null : uid,
        "Links": links == null ? null : links!.toJson(),
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
    this.rel,
    this.type,
    this.href,
    this.name,
  });

  Rel? rel;
  String? type;
  String? href;
  String? name;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        rel: json["@Rel"] == null ? null : relValues.map![json["@Rel"]],
        type: json["@Type"] == null ? null : json["@Type"],
        href: json["@Href"] == null ? null : json["@Href"],
        name: json["@Name"] == null ? null : json["@Name"],
      );

  Map<String, dynamic> toJson() => {
        "@Rel": rel == null ? null : relValues.reverse![rel],
        "@Type": type == null ? null : type,
        "@Href": href == null ? null : href,
        "@Name": name == null ? null : name,
      };
}

enum Rel { DOWN, ALTERNATE }

final relValues = EnumValues({"Alternate": Rel.ALTERNATE, "Down": Rel.DOWN});

class Xmln {
  Xmln({
    this.empty,
  });

  String? empty;

  factory Xmln.fromJson(Map<String, dynamic> json) => Xmln(
        empty: json["\u0024"] == null ? null : json["\u0024"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024": empty == null ? null : empty,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
