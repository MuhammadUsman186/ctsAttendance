import 'package:cts_app/Screens/History/Repository/history_repository.dart';
import 'package:cts_app/Screens/History/domain/history_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryListController extends StateNotifier<AsyncValue<List<History>>> {
  final HistoryRepository _historyRepository;
  HistoryListController(this._historyRepository)
      : super(const AsyncValue.loading()) {
    getHistory();
  }

  Future<void> getHistory({List<History> history = const []}) async {
    state = const AsyncValue.loading();

    final value = await AsyncValue.guard(
        () => _historyRepository.getHistoryList(history));
    if (value.hasError) {
      state = AsyncValue.error(value.error!, StackTrace.current);
    } else {
      state = AsyncValue.data(value.value!);
      // return value.value;
    }
  }
}

final historyListControllerProvider = StateNotifierProvider.autoDispose<
    HistoryListController, AsyncValue<List<History>>>((ref) {
  final historyRepository = ref.watch(historyRepositoryProvider);
  return HistoryListController(historyRepository);
});
