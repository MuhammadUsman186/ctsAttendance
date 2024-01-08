import 'package:cts_app/Screens/Account/data/account_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/account_model.dart';

class AccountController extends StateNotifier<AsyncValue<AccountModel>> {
  final AccountRepository _accountRepository;
  AccountController(
    this._accountRepository,
  ) : super(const AsyncValue.loading()) {
    getAccountDetails();
  }
  Future<void> getAccountDetails() async {
    state = const AsyncValue.loading();
    final value =
        await AsyncValue.guard(() => _accountRepository.getAccountDetails());
    if (value.hasError) {
      state = AsyncValue.error(value.error!, StackTrace.current);
      // return null;
    } else {
      state = AsyncValue.data(value.value!);
      // return value.value;
    }
  }
}

final accountControllerProvider = StateNotifierProvider.autoDispose<
    AccountController, AsyncValue<AccountModel>>((ref) {
  final accountRepository = ref.watch(accountRepositoryProvider);
  return AccountController(accountRepository);
});
