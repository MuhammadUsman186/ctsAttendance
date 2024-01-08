import 'package:camera/camera.dart';
import 'package:cts_app/Screens/StudentProfile/Repository/profile_repository.dart';
import 'package:cts_app/Screens/StudentProfile/domain/std_profile.dart';
import 'package:flutter/cupertino.dart';

class ProfileService extends ChangeNotifier {
  final ProfileRepository _profileRepository = ProfileRepository();

  StdProfileModel data = StdProfileModel();
  StdProfileModel get getProfileData => data;

  bool loading = false;

  Future<void> getAllTasks(XFile picture, int id) async {
    loading = true;
    notifyListeners();

    var response = await _profileRepository.postStdImg(picture, id);
    print(response);
    // data = response;
    // loading = false;
    // notifyListeners();
  }
}
