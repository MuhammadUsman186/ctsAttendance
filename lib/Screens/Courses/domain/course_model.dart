// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CourseModel welcomeFromJson(String str) =>
    CourseModel.fromJson(json.decode(str));

String welcomeToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
  bool? success;
  String? message;
  dynamic error;
  List<Course>? data;

  CourseModel({
    this.success,
    this.message,
    this.error,
    this.data,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        success: json["success"],
        message: json["message"],
        error: json["error"],
        data: json["data"] == null
            ? []
            : List<Course>.from(json["data"]!.map((x) => Course.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "error": error,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Course {
  int? lectureId;
  int? courseId;
  String? courseName;
  String? folderName;
  DateTime? startDate;
  String? uniqueIdentifer;
  int? classId;
  String? className;
  int? registeredStudents;
  int? unRegisteredStudents;

  Course({
    this.lectureId,
    this.courseId,
    this.courseName,
    this.folderName,
    this.startDate,
    this.uniqueIdentifer,
    this.classId,
    this.className,
    this.registeredStudents,
    this.unRegisteredStudents,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        lectureId: json["lecture_Id"],
        courseId: json["course_Id"],
        courseName: json["courseName"],
        folderName: json["folderName"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        uniqueIdentifer: json["uniqueIdentifer"],
        classId: json["class_Id"],
        className: json["className"],
        registeredStudents: json["registeredStudents"],
        unRegisteredStudents: json["unRegisteredStudents"],
      );

  Map<String, dynamic> toJson() => {
        "lecture_Id": lectureId,
        "course_Id": courseId,
        "courseName": courseName,
        "folderName": folderName,
        "startDate": startDate?.toIso8601String(),
        "uniqueIdentifer": uniqueIdentifer,
        "class_Id": classId,
        "className": className,
        "registeredStudents": registeredStudents,
        "unRegisteredStudents": unRegisteredStudents,
      };
}
