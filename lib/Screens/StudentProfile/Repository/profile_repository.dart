import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:cts_app/data/remote/network/NetworkApiService.dart';
import 'package:cts_app/data/remote/network/SecureStorage.dart';
import 'package:cts_app/login/domain/login_model.dart';
import 'package:path/path.dart' as p;
import '../../../data/remote/AppException.dart';
import '../../../data/remote/network/ApiEndPoints.dart';

class ProfileRepository {
  NetworkApiService networkApiService = NetworkApiService();
  final storage = SecureStorage();
  LoginModel loginModel = LoginModel();
  Future<String> postStdImg(XFile picture, int id) async {
    Uint8List bytes = await picture.readAsBytes();

    String image = base64.encode(bytes);
    print(image);
    final path = picture.path;
    String fileType = p.extension(path);
    // String fileType = fileType1.split('.')[1];

    print(fileType);
    print(id);
    Map<String, String> parameters = {};
    parameters['file_name'] = "";
    parameters['file_path'] = "";
    parameters['file_content'] = image;
    parameters['file_extension'] = fileType;
    try {
      var response = await networkApiService.putResponse(
          '${ApiEndPoints.uploadStudentImage}/$id',
          parameters,
          loginModel.data!.token!);

      print(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e, st) {
      print(e);
      print(st);
    }
    return ' Completed';
  }
}
