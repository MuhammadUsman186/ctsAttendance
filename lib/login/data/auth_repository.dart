import 'package:cts_app/data/remote/network/ApiEndPoints.dart';
import 'package:cts_app/data/remote/network/NetworkApiService.dart';
import 'package:cts_app/data/remote/network/SecureStorage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import '../domain/login_model.dart';

// final storage = SecureStorage();

class AuthRepository {
  final NetworkApiService networkApiService;
  final http.Client client;
  final SecureStorage secureStorage;
  // final FirebaseAuth auth;

  // final GoogleSignIn googleSignIn;
  // final SharedPreferences? preferences;

  late LoginModel? _loginModel;
  AuthRepository({
    required this.networkApiService,
    required this.client,
    required this.secureStorage,
  });

  Future<LoginModel?> signInWithEmailPassword(
      String username, String password, bool rememberMe) async {
    var response = await networkApiService.postResponse(
        ApiEndPoints.login, {"username": username, "password": password}, "");

    _loginModel = LoginModel.fromJson(response);
    String? token = _loginModel!.data!.token;
    if (token == null) {
      throw Exception('No token in response');
    }
    if (rememberMe) {
      await secureStorage.setUsername(username);
      await secureStorage.setPassword(password);
    }
    return _loginModel;
  }

  LoginModel? getLoginModel() {
    return _loginModel;
  }

  Future<LoginModel?> signInWithGoogle() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      user = userCredential.user;
    }
    LoginModel? loginModel = LoginModel(
        success: true,
        data: Data(
            token: user!.tenantId,
            user: Users(
                email: user.email,
                firstName: user.refreshToken,
                lastName: user.uid)));
    return loginModel;
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return AuthRepository(
    networkApiService: NetworkApiService(),
    client: http.Client(),
    secureStorage: storage,
  );
});
