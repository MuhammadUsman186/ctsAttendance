// To parse this JSON data, do
//
//     final studentModel = studentModelFromJson(jsonString);

import 'dart:convert';

StudentModel studentModelFromJson(String str) =>
    StudentModel.fromJson(json.decode(str));

String studentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {
  int? pageNumber;
  int? pageSize;
  int? totalPages;
  int? totalRecords;
  bool? success;
  String? message;
  dynamic error;
  List<StudentData>? data;

  StudentModel({
    this.pageNumber,
    this.pageSize,
    this.totalPages,
    this.totalRecords,
    this.success,
    this.message,
    this.error,
    this.data,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        pageNumber: json["page_number"],
        pageSize: json["page_size"],
        totalPages: json["total_pages"],
        totalRecords: json["total_records"],
        success: json["success"],
        message: json["message"],
        error: json["error"],
        data: json["data"] == null
            ? []
            : List<StudentData>.from(
                json["data"]!.map((x) => StudentData.fromJson(x))),
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

class StudentData {
  String? image;
  String? firstName;
  dynamic middleName;
  String? lastName;
  int? id;

  StudentData({
    this.image,
    this.firstName,
    this.middleName,
    this.lastName,
    this.id,
  });

  factory StudentData.fromJson(Map<String, dynamic> json) {
    String name = 'Student';

    return StudentData(
      image: json["image"],
      firstName: name,
      middleName: json["middleName"],
      lastName: json["lastName"],
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "image": image,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "id": id,
      };
}
