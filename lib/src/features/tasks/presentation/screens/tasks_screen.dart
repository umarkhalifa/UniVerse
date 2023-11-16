import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/core/router/router_names.dart';

class TasksScreen extends HookWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 3);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Tasks"),
        actions: [
          IconButton(onPressed: (){
            context.pushNamed(RouterNames.addTask.name);
          }, icon: const Icon(
            SolarIconsOutline.documentAdd,
          ),),
          gapW20,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
              width: MediaQuery.sizeOf(context).width,
              child: TabBar(
                controller: tabController,
                tabs: const [
                  Text("All"),
                  Text("Ongoing"),
                  Text("Completed"),
                ],
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: UniVerseColours.kGray2,
              ),
            ),
            ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    context.pushNamed(RouterNames.taskDetails.name);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: UniVerseColours.kSecondary,
                        borderRadius: BorderRadius.circular(7)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              child: Text("A"),
                            ),
                            gapW16,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sen 301 Assignment",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Due: 20-11-2018",
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: UniVerseColours.kGray3),
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 3),
                                        decoration: BoxDecoration(
                                          color: UniVerseColours.kPurple.withOpacity(0.4),
                                          borderRadius: BorderRadius.circular(2)
                                        ),
                                        child: Text(
                                          "High",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: UniVerseColours.kWhite
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        gapH16,
                        const Text(
                          "Brief",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "Typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since if you want ti ",
                          style: TextStyle(color: UniVerseColours.kGray3),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) {
                return gapH20;
              },
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 10, right: 15, left: 15),
            )
          ],
        ),
      ),
    );
  }
}
