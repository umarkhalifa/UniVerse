import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/home/presentation/providers/home_provider.dart';
import 'package:uni_verse/src/features/home/presentation/providers/home_state.dart';
import 'package:uni_verse/src/features/schedule/domain/usecase/_schedule_use_case.dart';
import 'package:uni_verse/src/features/schedule/presentation/providers/schedule_state.dart';
import 'package:uni_verse/src/utils/snackbar.dart';

class ScheduleProvider extends StateNotifier<ScheduleState> {
  ScheduleProvider(this._useCase, this._ref) : super(ScheduleState.initial()) {
    getSchedule();
  }

  final ScheduleUseCase _useCase;
  final Ref _ref;

  Future<void> getSchedule() async {
    state = state.copyWith(appState: AppState.loading);
    final value =
        await _useCase.call(_ref.read(homeNotifier).userEntity?.level ?? '');
    state = value.fold(
      (l) {
        _ref.read(snackBarProvider).showErrorMessageSnackBar(l.message);
        return state.copyWith(appState: AppState.error);
      },
      //9:00 am
      (r) {
        final items = r;
        items.sort(
              (a, b) => int.parse(a.startTime!.length == 7 ? a.startTime![0]:a.startTime!.substring(0, 2)).compareTo(
            int.parse(
              b.startTime!.length == 7 ? b.startTime![0]:b.startTime!.substring(0, 2),
            ),
          ),
        );
        return state.copyWith(
            timeTable: items,
            classes: items
                .where((element) => element.day == DateTime.now().weekday)
                .toList(),
            appState: AppState.idle);
      },
    );
  }

//  ! UPDATE DATE TO GET APPROPRIATE CALENDER
  void updateDate(DateTime dateTime) {
    state = state.copyWith(selectedDate: dateTime);
    final items = state.timeTable
        ?.where((element) => element.day == dateTime.weekday)
        .toList();
    state = state.copyWith(classes: items);
  }
}

final scheduleNotifier = StateNotifierProvider<ScheduleProvider, ScheduleState>(
  (ref) {
    final useCase = ref.read(scheduleUseCase);
    return ScheduleProvider(useCase, ref);
  },
);
