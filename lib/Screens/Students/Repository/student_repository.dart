import 'package:cts_app/Screens/Students/domain/student_model.dart';
import 'package:cts_app/data/remote/network/ApiEndPoints.dart';
import 'package:cts_app/data/remote/network/NetworkApiService.dart';
import 'package:cts_app/login/data/auth_repository.dart';
import 'package:cts_app/login/domain/login_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class StudentGridRepository {
  final http.Client client;
  final NetworkApiService networkApiService;
  final LoginModel loginModel;
  StudentGridRepository(
      {required this.loginModel,
      required this.networkApiService,
      required this.client});

  Future<List<StudentData>> getStudentsList(List<StudentData> data) async {
    var response = await networkApiService.getResponse(
        ApiEndPoints.allStudents, loginModel.data!.token!,
        addHeaders: {'Content-Type': 'application/json'});
    StudentModel student = StudentModel.fromJson(response);

    return student.data!;
  }

  // Future<UploadImageModel> uploadImage(String id, String format, String image) async {
  //   String fileType = format.substring(1);
  //   var params = {
  //     "file_name": "",
  //     "file_path": "",
  //     "file_content": image,
  //     "file_extension": fileType
  //   };

  //   Map<String,String> parameters = {};
  //   parameters['file_name'] = "";
  //   parameters['file_path'] = "";
  //   parameters['file_content'] = image;
  //   parameters['file_extension'] = fileType;

  //   final response = await networkApiService.putResponse("${ApiEndPoints.uploadStudentImage}/$id", parameters,loginModel.data!.token!);
  //   return UploadImageModel.fromJson(response);
  // }
}

final studentsGridRepositoryProvider =
    Provider.autoDispose<StudentGridRepository>((ref) {
  final auth = ref.watch(authRepositoryProvider);
  final loginModel = auth.getLoginModel();
  return StudentGridRepository(
      client: http.Client(),
      networkApiService: NetworkApiService(),
      loginModel: loginModel!);
});
