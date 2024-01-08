import 'dart:convert';

StdProfileModel stdProfileModelFromJson(String str) =>
    StdProfileModel.fromJson(json.decode(str));

String stdProfileModelToJson(StdProfileModel data) =>
    json.encode(data.toJson());

class StdProfileModel {
  bool? success;
  String? message;
  dynamic error;
  ProfileData? data;

  StdProfileModel({
    this.success,
    this.message,
    this.error,
    this.data,
  });

  factory StdProfileModel.fromJson(Map<String, dynamic> json) =>
      StdProfileModel(
        success: json["success"],
        message: json["message"],
        error: json["error"],
        data: json["data"] == null ? null : ProfileData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "error": error,
        "data": data?.toJson(),
      };
}

class ProfileData {
  int? id;
  String? name;
  Image? image;
  List<dynamic>? guardians;
  List<dynamic>? upComingClasses;

  ProfileData({
    this.id,
    this.name,
    this.image,
    this.guardians,
    this.upComingClasses,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        id: json["id"],
        name: json["name"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        guardians: json["guardians"] == null
            ? []
            : List<dynamic>.from(json["guardians"]!.map((x) => x)),
        upComingClasses: json["upComingClasses"] == null
            ? []
            : List<dynamic>.from(json["upComingClasses"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image?.toJson(),
        "guardians": guardians == null
            ? []
            : List<dynamic>.from(guardians!.map((x) => x)),
        "upComingClasses": upComingClasses == null
            ? []
            : List<dynamic>.from(upComingClasses!.map((x) => x)),
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
