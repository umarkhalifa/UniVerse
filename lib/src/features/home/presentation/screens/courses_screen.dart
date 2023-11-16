import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/core/router/router_names.dart';
import 'package:uni_verse/src/features/home/presentation/providers/course_provider.dart';
import 'package:uni_verse/src/features/home/presentation/providers/home_state.dart';
import 'package:uni_verse/src/features/home/presentation/screens/home_screen.dart';
import 'package:uni_verse/src/features/home/presentation/widgets/loading_shimmer.dart';

class CoursesScreen extends ConsumerWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final courseState = ref.watch(courseProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UniVerseColours.kBackground,
        title: const Text(
          "Courses",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: courseState.appState == AppState.loading?
      const LoadingShimmer():ListView.separated(
        itemBuilder: (context, index) {
          final course = courseState.courses?[index];
          return GestureDetector(
            onTap: (){
              context.pushNamed(RouterNames.courseDetail.name,extra: course);
            },
            child: Container(
              height: 160,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: UniVerseColours.kSecondary,
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        course?.status?[0] == 'C'?'Compulsory'.toUpperCase():'Required'.toUpperCase(),
                        style:  TextStyle(
                            color: UniVerseColours.kPurple,
                            fontSize: 12.sp
                        ),
                      ),
                      const Spacer(),
                      Text('${course?.courseCode}',style: TextStyle(fontSize: 14.sp),)
                    ],
                  ),
                  const Divider(color: UniVerseColours.kGray3,thickness: 0.3,),
                  gapH8,
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 2,
                        color: UniVerseColours.kPurple,
                      ),
                      gapW16,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${course?.courseTitle}',
                              style:  TextStyle(fontSize: 16.sp),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(SolarIconsOutline.user,color: UniVerseColours.kGray3,size: 17,),
                      gapW4,
                      Text('${course?.instructor}',style: TextStyle(color: UniVerseColours.kGray3,fontSize: 12.sp),),
                      gapW24,
                      const Icon(SolarIconsOutline.notes,color: UniVerseColours.kGray3,size: 17,),
                      gapW4,
                      Text("${course?.creditHours} units",style:  TextStyle(color: UniVerseColours.kGray3,fontSize: 12.sp),),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (_, __) {
          return gapH16;
        },
        itemCount: courseState.courses?.length ?? 0,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15),
      ),
    );
  }
}
