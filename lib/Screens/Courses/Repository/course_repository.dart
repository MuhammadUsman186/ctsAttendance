import 'package:cts_app/Screens/Courses/domain/course_model.dart';
import 'package:cts_app/data/remote/network/ApiEndPoints.dart';
import 'package:cts_app/data/remote/network/NetworkApiService.dart';
import 'package:cts_app/login/data/auth_repository.dart';
import 'package:cts_app/login/domain/login_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class CourseRepository {
  final http.Client client;
  final NetworkApiService networkApiService;
  final LoginModel loginModel;
  CourseRepository(
      {required this.loginModel,
      required this.networkApiService,
      required this.client});

  Future<List<Course>> getCourseList(List<Course> data) async {
    var response = await networkApiService.getResponse(
        ApiEndPoints.teacherCourse, loginModel.data!.token!,
        addHeaders: {'Content-Type': 'application/json'});
    CourseModel course = CourseModel.fromJson(response);
    // data.clear();
    // for (int i = 0; i < course.data!.length; i++) {
    //   data.add(course.data![i]);
    // }
    return course.data!;
  }
}

final courseRepositoryProvider = Provider<CourseRepository>((ref) {
  final auth = ref.watch(authRepositoryProvider);
  final loginModel = auth.getLoginModel();
  return CourseRepository(
    networkApiService: NetworkApiService(),
    client: http.Client(),
    loginModel: loginModel!,
  );
});
