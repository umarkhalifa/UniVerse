import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/core/router/router_names.dart';
import 'package:uni_verse/src/features/home/presentation/providers/home_provider.dart';
import 'package:uni_verse/src/features/home/presentation/providers/home_state.dart';

import '../widgets/home_widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeNotifier);
    return Scaffold(
      body: SafeArea(
        child: homeState.appState == AppState.loading
            ? const LoadingShimmer()
            : SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //! HEADER
                    const HomeHeader(),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 16, right: 15),
                      child: Row(
                        children: [
                          Text(
                            "My Courses",
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(RouterNames.courses.name);
                            },
                            child: const Text(
                              "View all",
                              style: TextStyle(color: UniVerseColours.kPurple),
                            ),
                          ),
                        ],
                      ),
                    ),
                    gapH16,
                    HomeCourseList(
                      courses: homeState.courses!,
                    ),
                    gapH24,
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "My Schedule",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    gapH20,

                    LecturesList(lectures: homeState.lectures!)
                  ],
                ),
              ),
      ),
    );
  }
}




