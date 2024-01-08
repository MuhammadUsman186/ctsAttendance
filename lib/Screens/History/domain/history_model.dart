// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

HistoryModel historyModelFromJson(String str) =>
    HistoryModel.fromJson(json.decode(str));

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
  int? pageNumber;
  int? pageSize;
  int? totalPages;
  int? totalRecords;
  bool? success;
  String? message;
  dynamic error;
  List<History>? data;

  HistoryModel({
    this.pageNumber,
    this.pageSize,
    this.totalPages,
    this.totalRecords,
    this.success,
    this.message,
    this.error,
    this.data,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        pageNumber: json["page_number"],
        pageSize: json["page_size"],
        totalPages: json["total_pages"],
        totalRecords: json["total_records"],
        success: json["success"],
        message: json["message"],
        error: json["error"],
        data: json["data"] == null
            ? []
            : List<History>.from(json["data"]!.map((x) => History.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page_number": pageNumber,
        "page_size": pageSize,
        "total_pages": totalPages,
        "total_records": totalRecords,
        "success": success,
        "message": message,
        "error": error,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class History {
  int? id;
  String? className;
  String? course;
  int? day;
  String? startDate;
  int? numberOfAbsents;
  String? days;

  History(
      {this.id,
      this.className,
      this.course,
      this.day,
      this.startDate,
      this.numberOfAbsents,
      this.days});

  factory History.fromJson(Map<String, dynamic> json) {
    String date = json['startDate'];

    final DateTime now = DateFormat("yyyy-MM-dd").parse(date);

    String course = 'ENGLISH';
    String days2 = DateFormat("yyyy-MM-dd").format(now);

    String days = (DateFormat('EEEE').format(now));

    return History(
        id: json["id"],
        className: json["className"],
        course: course,
        day: json["day"],
        startDate: days2,
        numberOfAbsents: json["numberOfAbsents"],
        days: days);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "className": className,
        "course": course,
        "day": day,
        "startDate": startDate,
        "numberOfAbsents": numberOfAbsents,
      };
}
