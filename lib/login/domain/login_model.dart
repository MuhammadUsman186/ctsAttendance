import 'dart:convert';

LoginModel welcomeFromJson(String str) => LoginModel.fromJson(json.decode(str));

String welcomeToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool? success;
  String? message;
  dynamic error;
  Data? data;

  LoginModel({
    this.success,
    this.message,
    this.error,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        message: json["message"],
        error: json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "error": error,
        "data": data?.toJson(),
      };
}

class Data {
  String? token;
  String? tokenType;
  Users? user;
  String? role;

  Data({
    this.token,
    this.tokenType,
    this.user,
    this.role,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        tokenType: json["token_type"],
        user: json["user"] == null ? null : Users.fromJson(json["user"]),
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "token_type": tokenType,
        "user": user?.toJson(),
        "role": role,
      };
}

class Users {
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? email;
  String? phone;
  String? mobile;
  bool? requirePasswordUpdate;
  String? type;
  bool? active;
  String? username;
  bool? isSuper;
  int? businessId;
  DateTime? createdAt;
  bool? isSubscriptionExpired;
  dynamic createdBy;
  dynamic schools;
  List<Role>? roles;
  dynamic brandingSetup;
  List<ModulePermission>? modulePermissions;

  Users({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.email,
    this.phone,
    this.mobile,
    this.requirePasswordUpdate,
    this.type,
    this.active,
    this.username,
    this.isSuper,
    this.businessId,
    this.createdAt,
    this.isSubscriptionExpired,
    this.createdBy,
    this.schools,
    this.roles,
    this.brandingSetup,
    this.modulePermissions,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        mobile: json["mobile"],
        requirePasswordUpdate: json["requirePasswordUpdate"],
        type: json["type"],
        active: json["active"],
        username: json["username"],
        isSuper: json["isSuper"],
        businessId: json["business_Id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        isSubscriptionExpired: json["isSubscriptionExpired"],
        createdBy: json["createdBy"],
        schools: json["schools"],
        roles: json["roles"] == null
            ? []
            : List<Role>.from(json["roles"]!.map((x) => Role.fromJson(x))),
        brandingSetup: json["brandingSetup"],
        modulePermissions: json["module_permissions"] == null
            ? []
            : List<ModulePermission>.from(json["module_permissions"]!
                .map((x) => ModulePermission.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "mobile": mobile,
        "requirePasswordUpdate": requirePasswordUpdate,
        "type": type,
        "active": active,
        "username": username,
        "isSuper": isSuper,
        "business_Id": businessId,
        "createdAt": createdAt?.toIso8601String(),
        "isSubscriptionExpired": isSubscriptionExpired,
        "createdBy": createdBy,
        "schools": schools,
        "roles": roles == null
            ? []
            : List<dynamic>.from(roles!.map((x) => x.toJson())),
        "brandingSetup": brandingSetup,
        "module_permissions": modulePermissions == null
            ? []
            : List<dynamic>.from(modulePermissions!.map((x) => x.toJson())),
      };
}

class ModulePermission {
  String? name;
  bool? add;
  bool? update;
  bool? view;
  bool? delete;

  ModulePermission({
    this.name,
    this.add,
    this.update,
    this.view,
    this.delete,
  });

  factory ModulePermission.fromJson(Map<String, dynamic> json) =>
      ModulePermission(
        name: json["name"],
        add: json["add"],
        update: json["update"],
        view: json["view"],
        delete: json["delete"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "add": add,
        "update": update,
        "view": view,
        "delete": delete,
      };
}

class Role {
  int? id;
  String? name;

  Role({
    this.id,
    this.name,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
