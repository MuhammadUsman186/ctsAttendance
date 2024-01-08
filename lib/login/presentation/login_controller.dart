import 'package:cts_app/data/remote/network/SecureStorage.dart';
import 'package:cts_app/login/data/auth_repository.dart';
import 'package:cts_app/login/domain/login_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController extends StateNotifier<AsyncValue<LoginModel?>> {
  final AuthRepository _authRepository;
  final SecureStorage secureStorage;

  LoginController(this._authRepository, this.secureStorage)
      : super(const AsyncValue<LoginModel?>.loading()) {
    rememberMeLogin();
  }

  Future<LoginModel?> loginWithUsernamePassword(
      String username, String password, bool rememberMe) async {
    state = const AsyncValue.loading();
    final value = await AsyncValue.guard(() => _authRepository
        .signInWithEmailPassword(username, password, rememberMe));
    if (value.hasError) {
      state = AsyncValue.error(value.error!, StackTrace.current);
      return null;
    } else {
      state = AsyncValue.data(value.value!);

      return value.value!;
    }
  }

  Future<LoginModel?> signWithGoogle() async {
    state = const AsyncValue.loading();
    final value =
        await AsyncValue.guard(() => _authRepository.signInWithGoogle());
    if (value.hasError) {
      state = AsyncValue.error(value.error!, StackTrace.current);
      return null;
    } else {
      state = AsyncValue.data(value.value);

      return value.value;
    }
  }

  void rememberMeLogin() async {
    final user = FirebaseAuth.instance.currentUser;

    final username = await secureStorage.getUsername();
    final password = await secureStorage.getPassword();
    if (username != null && password != null) {
      loginWithUsernamePassword(username, password, true);
    } else {
      state = const AsyncValue.data(null);
    }
    if (user != null) {
      signWithGoogle();
    } else {
      state = const AsyncValue.data(null);
    }
  }
}

final loginControllerProvider =
    StateNotifierProvider.autoDispose<LoginController, AsyncValue<LoginModel?>>(
        (ref) {
  final storage = ref.watch(secureStorageProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  return LoginController(authRepository, storage);
});
