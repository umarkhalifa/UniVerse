import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/home/domain/usecases/get_courses.dart';
import 'package:uni_verse/src/features/home/presentation/providers/course_state.dart';
import 'package:uni_verse/src/features/home/presentation/providers/home_provider.dart';
import 'package:uni_verse/src/features/home/presentation/providers/home_state.dart';
import 'package:uni_verse/src/utils/snackbar.dart';

class CourseProvider extends StateNotifier<CourseState> {
  CourseProvider(this._getCourses, this._ref) : super(CourseState.initial()) {
    getCourses();
  }

  final GetCourses _getCourses;
  final Ref _ref;

  Future<void> getCourses() async {
    state = state.copyWith(appState: AppState.loading);
    final value =
        await _getCourses.call(_ref.read(homeNotifier).userEntity?.level ?? '');
    state = value.fold((l) {
      _ref.read(snackBarProvider).showErrorMessageSnackBar(l.message);
      return state.copyWith(appState: AppState.error, errorMessage: l.message);
    }, (r) {
      return state.copyWith(appState: AppState.idle, courses: r);
    });
  }
}

final courseProvider =
    StateNotifierProvider<CourseProvider, CourseState>((ref) {
  final useCase = ref.read(homeCoursesUseCaseProvider);
  return CourseProvider(useCase, ref);
});
