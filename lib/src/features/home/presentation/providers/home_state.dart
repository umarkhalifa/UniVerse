import 'package:uni_verse/src/features/home/domain/entities/course.dart';
import 'package:uni_verse/src/features/home/domain/entities/lecture.dart';
import 'package:uni_verse/src/features/home/domain/entities/user.dart';

enum AppState { idle, loading, error }

class HomeState {
  final UserEntity? userEntity;
  final List<Lecture>? lectures;
  final List<Course>? courses;
  final AppState? appState;
  final String? errorMessage;

  HomeState(
      {this.userEntity,
      this.lectures,
      this.courses,
      this.appState,
      this.errorMessage});

  HomeState.initial(
      {this.userEntity,
      this.appState = AppState.idle,
      this.courses = const [],
      this.lectures = const [],
      this.errorMessage = ''});

  HomeState copyWith({
    UserEntity? userEntity,
    List<Lecture>? lectures,
    List<Course>? courses,
    AppState? appState,
    String? errorMessage,
  }) {
    return HomeState(
      userEntity: userEntity ?? this.userEntity,
      lectures: lectures ?? this.lectures,
      courses: courses ?? this.courses,
      appState: appState ?? this.appState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
