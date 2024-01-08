import 'package:cts_app/Screens/Courses/Repository/course_repository.dart';
import 'package:cts_app/Screens/Courses/domain/course_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseListController extends StateNotifier<AsyncValue<List<Course>>> {
  final CourseRepository _courseRepository;
  CourseListController(this._courseRepository)
      : super(const AsyncValue.loading()) {
    getCourse();
  }
  Future<void> getCourse({List<Course> courses = const []}) async {
    state = const AsyncValue.loading();

    final value =
        await AsyncValue.guard(() => _courseRepository.getCourseList(courses));

    if (value.hasError) {
      state = AsyncValue.error(value.error!, StackTrace.current);
    } else {
      state = AsyncValue.data(value.value!);
      // return value.value;
    }
  }
}

final courseListControllerProvider = StateNotifierProvider.autoDispose<
    CourseListController, AsyncValue<List<Course>>>((ref) {
  final courseRepository = ref.watch(courseRepositoryProvider);
  return CourseListController(courseRepository);
});
