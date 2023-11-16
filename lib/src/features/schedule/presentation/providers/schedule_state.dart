import 'package:uni_verse/src/features/home/domain/entities/lecture.dart';
import 'package:uni_verse/src/features/home/presentation/providers/home_state.dart';

class ScheduleState {
  final AppState? appState;
  final List<Lecture>? timeTable;
  final List<Lecture>? classes;
  final List<Lecture>? examTimeTable;
  final DateTime? selectedDate;
  final bool? isLoading;

  ScheduleState(
      {this.appState,
        this.timeTable,
      this.classes,
      this.examTimeTable,
      this.selectedDate,
      this.isLoading});

  ScheduleState.initial({
    this.appState = AppState.idle,
    this.timeTable = const [],
    this.classes = const [],
    this.examTimeTable = const [],
    this.isLoading = false,
  }) : selectedDate = DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day);

  ScheduleState copyWith({
    AppState? appState,
    List<Lecture>? timeTable,
    List<Lecture>? classes,
    List<Lecture>? examTimeTable,
    DateTime? selectedDate,
    bool? isLoading,
  }) {
    return ScheduleState(
      appState: appState ?? this.appState,
      timeTable: timeTable ?? this.timeTable,
      classes: classes ?? this.classes,
      examTimeTable: examTimeTable ?? this.examTimeTable,
      selectedDate: selectedDate ?? this.selectedDate,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
