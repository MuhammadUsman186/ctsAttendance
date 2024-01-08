import 'package:cts_app/Screens/Account/domain/account_model.dart';
import 'package:cts_app/data/remote/network/ApiEndPoints.dart';
import 'package:cts_app/data/remote/network/NetworkApiService.dart';
import 'package:cts_app/login/data/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../../../login/domain/login_model.dart';

class AccountRepository {
  final http.Client client;
  final NetworkApiService networkApiService;
  final LoginModel loginModel;
  AccountRepository(
      {required this.client,
      required this.networkApiService,
      required this.loginModel});
  // Future<AccountData> getAccData() async {
  //   var response = await networkApiService.getResponse(
  //       ApiEndPoints.account, loginModel.data!.token!,
  //       addHeaders: {'Content-Type': 'application/json'});
  //   AccountModel account = AccountModel.fromJson(response);
  //   return account.data!;
  // }
  Future<AccountModel> getAccountDetails() async {
    final response = await networkApiService.getResponse(
        ApiEndPoints.account, loginModel.data!.token!);
    return AccountModel.fromJson(response);
  }
}

final accountRepositoryProvider = Provider<AccountRepository>((ref) {
  final auth = ref.watch(authRepositoryProvider);
  final loginModel = auth.getLoginModel();
  return AccountRepository(
      client: http.Client(),
      networkApiService: NetworkApiService(),
      loginModel: loginModel!);
});
