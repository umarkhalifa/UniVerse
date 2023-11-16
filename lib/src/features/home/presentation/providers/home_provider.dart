import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/home/domain/usecases/get_current_lecture_usecase.dart';
import 'package:uni_verse/src/features/home/domain/usecases/get_home_courses_usecase.dart';
import 'package:uni_verse/src/features/home/domain/usecases/get_user_profile_usecase.dart';
import 'package:uni_verse/src/features/home/presentation/providers/home_state.dart';
import 'package:uni_verse/src/utils/snackbar.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier(
      this._useCase, this._lectureUseCase, this._courseUseCase, this._ref)
      : super(HomeState.initial()){getHomeData();}

  final GetHomeCourseUseCase _courseUseCase;
  final GetCurrentLectureUseCase _lectureUseCase;
  final GetUserUseCase _useCase;
  final Ref _ref;

// ! FETCH USER PROFILE
  Future<void> fetchUser() async {
    final value = await _useCase.call(null);
    state = value.fold(
      (l) {
        return state.copyWith(
            appState: AppState.error, errorMessage: l.message);
      },
      (r) {
        return state.copyWith(userEntity: r);
      },
    );
  }

  // ! FETCH HOME COURSES
  Future<void> fetchHomeCourses() async {
    if (state.userEntity != null) {
      final value = await _courseUseCase.call(state.userEntity!.level!);
      state = value.fold(
        (l) {
          return state.copyWith(
              appState: AppState.error, errorMessage: l.message);
        },
        (r) {
          return state.copyWith(courses: r);
        },
      );
    }
  }

  // ! FETCH CURRENT LECTURES
  Future<void> fetchCurrentLectures() async {
    if (state.userEntity != null) {
      final value = await _lectureUseCase.call(state.userEntity!.level!);
      state = value.fold(
        (l) {
          _ref.read(snackBarProvider).showErrorMessageSnackBar(l.message);
          return state.copyWith(
              appState: AppState.error, errorMessage: l.message);
        },
        (r) {
          return state.copyWith(lectures: r, appState: AppState.idle);
        },
      );
    }
  }

  Future<void> getHomeData() async {
    state = state.copyWith(appState: AppState.loading);
    await fetchUser();
    await fetchHomeCourses();
    await fetchCurrentLectures();
    state = state.copyWith(appState: AppState.idle);
  }
}

final homeNotifier = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final userCase = ref.read(getUserCaseProvider);
  final courseCase = ref.read(getHomeCaseProvider);
  final lectureCase = ref.read(getLectureCaseProvider);
  return HomeNotifier(userCase, lectureCase, courseCase, ref);
});
