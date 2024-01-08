// To parse this JSON data, do
//
//     final accountModel = accountModelFromJson(jsonString);

import 'dart:convert';

AccountModel accountModelFromJson(String str) =>
    AccountModel.fromJson(json.decode(str));

String accountModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
  bool? success;
  dynamic message;
  dynamic error;
  AccountData? data;

  AccountModel({
    this.success,
    this.message,
    this.error,
    this.data,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        success: json["success"],
        message: json["message"],
        error: json["error"],
        data: json["data"] == null ? null : AccountData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "error": error,
        "data": data?.toJson(),
      };
}

class AccountData {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? classesPerWeek;
  Image? image;
  School? school;
  List<TimeTable>? timeTable;

  AccountData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.classesPerWeek,
    this.image,
    this.school,
    this.timeTable,
  });

  factory AccountData.fromJson(Map<String, dynamic> json) => AccountData(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        classesPerWeek: json["classesPerWeek"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        school: json["school"] == null ? null : School.fromJson(json["school"]),
        timeTable: json["timeTable"] == null
            ? []
            : List<TimeTable>.from(
                json["timeTable"]!.map((x) => TimeTable.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "classesPerWeek": classesPerWeek,
        "image": image?.toJson(),
        "school": school?.toJson(),
        "timeTable": timeTable == null
            ? []
            : List<dynamic>.from(timeTable!.map((x) => x.toJson())),
      };
}

class Image {
  int? id;
  dynamic fileName;
  dynamic fileSize;
  String? filePath;

  Image({
    this.id,
    this.fileName,
    this.fileSize,
    this.filePath,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        fileName: json["file_name"],
        fileSize: json["file_size"],
        filePath: json["file_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "file_name": fileName,
        "file_size": fileSize,
        "file_path": filePath,
      };
}

class School {
  int? id;
  String? name;
  String? gradeLow;
  String? gradeHigh;
  String? phone;
  String? principleEmail;

  School({
    this.id,
    this.name,
    this.gradeLow,
    this.gradeHigh,
    this.phone,
    this.principleEmail,
  });

  factory School.fromJson(Map<String, dynamic> json) => School(
        id: json["id"],
        name: json["name"],
        gradeLow: json["gradeLow"],
        gradeHigh: json["gradeHigh"],
        phone: json["phone"],
        principleEmail: json["principleEmail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gradeLow": gradeLow,
        "gradeHigh": gradeHigh,
        "phone": phone,
        "principleEmail": principleEmail,
      };
}

class TimeTable {
  String? courseName;
  String? className;
  int? classesPerWeek;

  TimeTable({
    this.courseName,
    this.className,
    this.classesPerWeek,
  });

  factory TimeTable.fromJson(Map<String, dynamic> json) => TimeTable(
        courseName: json["courseName"],
        className: json["className"],
        classesPerWeek: json["classesPerWeek"],
      );

  Map<String, dynamic> toJson() => {
        "courseName": courseName,
        "className": className,
        "classesPerWeek": classesPerWeek,
      };
}
