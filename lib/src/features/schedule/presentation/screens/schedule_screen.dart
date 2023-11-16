import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/features/home/presentation/widgets/home_widgets.dart';
import 'package:uni_verse/src/features/home/presentation/providers/home_state.dart';
import 'package:uni_verse/src/features/schedule/presentation/providers/schedule_provider.dart';
import 'package:uni_verse/src/features/schedule/presentation/widgets/schedule_shimmer.dart';

class ScheduleScreen extends ConsumerWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduleState = ref.watch(scheduleNotifier);
    final days = getDate();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UniVerseColours.kSecondary,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Schedule",
          style: TextStyle(fontSize: 16.sp),
        ),
        actions: const [
          Icon(SolarIconsOutline.bell),
          gapW16,
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: UniVerseColours.kSecondary,
                child: Column(
                  children: [
                    gapH24,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          SolarIconsOutline.calendar,
                          size: 20,
                        ),
                        gapW12,
                        Text(
                          DateFormat('MMMM,yyyy').format(DateTime.now()),
                          style:  TextStyle(
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                    gapH20,
                    SizedBox(
                      height: 80,
                      width: MediaQuery.sizeOf(context).width,
                      child: CarouselSlider.builder(
                        itemCount: days.length,
                        itemBuilder: (context, index, _) {
                          return Column(
                            children: [
                              Text(
                                days[index].day.toString(),
                                style: TextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w500,
                                    color: days[index] ==
                                            scheduleState.selectedDate
                                        ? UniVerseColours.kPurple
                                        : UniVerseColours.kGray3,
                                    height: 1),
                              ),
                              Text(
                                DateFormat('EE').format(days[index]),
                                style: TextStyle(
                                  color:
                                      days[index] == scheduleState.selectedDate
                                          ? UniVerseColours.kPurple
                                          : UniVerseColours.kGray3,
                                  fontSize: 14.sp
                                ),
                              ),
                            ],
                          );
                        },
                        options: CarouselOptions(
                            enlargeCenterPage: true,
                            viewportFraction: 0.25,
                            onPageChanged: (index, _) {
                              ref
                                  .read(scheduleNotifier.notifier)
                                  .updateDate(days[index]);
                            }),
                      ),
                    ),
                    gapH20,
                  ],
                ),
              ),
              gapH20,
              gapH16,
              scheduleState.appState == AppState.loading?
                  const ScheduleShimmer():
             LecturesList(lectures: scheduleState.classes!)
            ],
          ),
        ),
      ),
    );
  }
}

List<DateTime> getDate() {
  return [
    for (int i = 0; i < 30; i++)
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .add(
        Duration(days: i),
      )
  ];
}



