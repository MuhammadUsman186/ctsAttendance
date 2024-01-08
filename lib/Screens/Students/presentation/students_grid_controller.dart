import 'package:cts_app/Screens/Students/Repository/student_repository.dart';
import 'package:cts_app/Screens/Students/domain/student_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentsGridController
    extends StateNotifier<AsyncValue<List<StudentData>>> {
  final StudentGridRepository _studentsGridRepository;
  StudentsGridController(
    this._studentsGridRepository,
  ) : super(const AsyncValue.loading()) {
    getStudentsList();
  }

  Future<void> getStudentsList(
      {List<StudentData> studentData = const []}) async {
    state = const AsyncValue.loading();
    final value = await AsyncValue.guard(
        () => _studentsGridRepository.getStudentsList(studentData));
    if (value.hasError) {
      state = AsyncValue.error(value.error!, StackTrace.current);
      // return null;
    } else {
      state = AsyncValue.data(value.value!);
      // return value.value;
    }
  }
}

final studentsGridControllerProvider = StateNotifierProvider.autoDispose<
    StudentsGridController, AsyncValue<List<StudentData>>>((ref) {
  final studentsGridRepository = ref.watch(studentsGridRepositoryProvider);
  return StudentsGridController(studentsGridRepository);
});
