import 'package:cts_app/Screens/History/domain/history_model.dart';
import 'package:cts_app/data/remote/network/ApiEndPoints.dart';
import 'package:cts_app/data/remote/network/NetworkApiService.dart';
import 'package:http/http.dart' as http;
import 'package:cts_app/login/data/auth_repository.dart';
import 'package:cts_app/login/domain/login_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryRepository {
  final http.Client client;
  final NetworkApiService networkApiService;
  final LoginModel loginModel;

  HistoryRepository(
      {required this.client,
      required this.networkApiService,
      required this.loginModel});

  Future<List<History>> getHistoryList(List<History> data) async {
    var response = await networkApiService.getResponse(
        ApiEndPoints.history, loginModel.data!.token!,
        addHeaders: {'Content-Type': 'application/json'});

    HistoryModel history = HistoryModel.fromJson(response);

    return history.data!;
  }
}

final historyRepositoryProvider = Provider<HistoryRepository>((ref) {
  final auth = ref.watch(authRepositoryProvider);
  final loginModel = auth.getLoginModel();
  return HistoryRepository(
    networkApiService: NetworkApiService(),
    client: http.Client(),
    loginModel: loginModel!,
  );
});
