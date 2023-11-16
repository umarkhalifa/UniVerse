import 'package:uni_verse/src/features/home/domain/entities/course.dart';
import 'package:uni_verse/src/features/home/presentation/providers/home_state.dart';

class CourseState {
  final AppState? appState;
  final List<Course>? courses;
  final String? errorMessage;

  CourseState({this.appState, this.errorMessage, this.courses});

  CourseState.initial(
      {this.appState = AppState.idle,
      this.courses = const [],
      this.errorMessage = ''});

  CourseState copyWith({
    AppState? appState,
    List<Course>? courses,
    String? errorMessage,
  }) {
    return CourseState(
      appState: appState ?? this.appState,
      courses: courses ?? this.courses,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
