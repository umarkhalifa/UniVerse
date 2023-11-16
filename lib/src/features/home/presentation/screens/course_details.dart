import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:uni_verse/src/core/constants/assets.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/core/router/router_names.dart';
import 'package:uni_verse/src/features/home/domain/entities/course.dart';

class CourseDetails extends StatelessWidget {
  final Course course;

  const CourseDetails({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UniVerseColours.kBackground,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${course.courseTitle}',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
              ),
              Text(
                "Course code: ${course.courseCode}",
                style:
                    TextStyle(color: UniVerseColours.kGray, fontSize: 14.sp),
              ),
              gapH24,
              gapH24,
              Text(
                "Description",
                style: TextStyle(fontSize: 16.sp),
              ),
              gapH16,
              Text(
                '${course.description}',
                style:
                    TextStyle(color: UniVerseColours.kGray, fontSize: 14.sp),
              ),
              gapH24,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                          color: UniVerseColours.kSecondary,
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Credit unit",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: UniVerseColours.kGray3),
                              ),
                              gapH12,
                              Text(
                                "${course.creditHours} units",
                                style: TextStyle(fontSize: 14.sp),
                              )
                            ],
                          ),
                          const Spacer(),
                          const CircleAvatar(
                            radius: 17,
                            child: Icon(SolarIconsOutline.notes),
                          ),
                        ],
                      ),
                    ),
                  ),
                  gapW24,
                  Expanded(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                          color: UniVerseColours.kSecondary,
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Instructor",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: UniVerseColours.kGray3),
                              ),
                              gapH12,
                              Text(
                                '${course.instructor}',
                                style: TextStyle(fontSize: 14.sp),
                              )
                            ],
                          ),
                          const Spacer(),
                          const CircleAvatar(
                            radius: 17,
                            child: Icon(SolarIconsOutline.user),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              gapH24,
              Text(
                "Materials",
                style: TextStyle(fontSize: 16.sp),
              ),
              ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: UniVerseColours.kSecondary),
                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                    child: GestureDetector(
                      onTap: (){
                        context.pushNamed(RouterNames.pdfView.name,extra: course.materials![index]);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            UniVerseAssets.pdf,
                            height: 40,
                          ),
                          gapW16,
                          Expanded(
                            child: Text(
                              '${course.courseTitle} ${index+1}',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) {
                  return gapH16;
                },
                itemCount: course.materials?.length ?? 0,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 20),
              ),
              Text(
                "Past questions",
                style: TextStyle(fontSize: 16.sp),
              ),
              gapH16,
              ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: UniVerseColours.kSecondary),
                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                    child: GestureDetector(
                      onTap: (){
                        context.pushNamed(RouterNames.imageView.name, extra: {
                          'id':course.courseCode,
                          'image':course.pastQuestions![index]
                        });
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            UniVerseAssets.pdf,
                            height: 40,
                          ),
                          gapW16,
                          Expanded(
                            child: Text(
                              'Past question ${index+1}',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) {
                  return gapH16;
                },
                itemCount: course.pastQuestions?.length ?? 0,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
