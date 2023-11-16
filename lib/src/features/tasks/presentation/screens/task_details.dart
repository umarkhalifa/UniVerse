import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:uni_verse/src/core/constants/assets.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/core/widgets/button.dart';
import 'package:uni_verse/src/core/widgets/text_field.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Task Details"),
        actions: const [Icon(SolarIconsOutline.menuDots), gapW20],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sen 213 Assignment",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17.sp),
              ),
              gapH8,
              const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                style: TextStyle(color: UniVerseColours.kGray3),
              ),
              gapH16,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: UniVerseColours.kGray2)),
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Deadline",
                            style: TextStyle(
                                fontSize: 12.sp, color: UniVerseColours.kGray2),
                          ),
                          const Row(
                            children: [
                              Icon(
                                SolarIconsOutline.clockCircle,
                                color: UniVerseColours.kPurple,
                              ),
                              gapW4,
                              Text("12 March")
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  gapW20,
                  Expanded(
                    child: Container(
                      height: 60.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: UniVerseColours.kGray2)),
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Priority",
                            style: TextStyle(
                                fontSize: 12.sp, color: UniVerseColours.kGray2),
                          ),
                          const Row(
                            children: [
                              Icon(
                                SolarIconsOutline.alarm,
                                color: UniVerseColours.kPurple,
                              ),
                              gapW4,
                              Text("High")
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              gapH16,
              const Text("Subtasks"),
              gapH12,
              Container(
                height: 60,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: UniVerseColours.kPurple,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Discuss & finalize design approach",
                    style: TextStyle(color: UniVerseColours.kWhite),
                  ),
                ),
              ),
              gapH12,
              GestureDetector(
                onTap: ()async{
                  await showModalBottomSheet(context: context,isScrollControlled: true, builder: (context){
                    return ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 1000),
                      child: SingleChildScrollView(
                        child: Container(
                          color: UniVerseColours.kWhite,
                          padding: EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 25,
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: const Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(),
                                  Text("Add a Subtask",
                                  style: TextStyle(
                                    fontSize: 17
                                  ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(SolarIconsOutline.closeCircle,color: UniVerseColours.kPurple,),
                                  ),
                                ],
                              ),
                              UniverseTextField(label: "Subtask",maxLines: 1,),
                              gapH24,
                              gapH24,
                              UniverseButton(label: "Add Subtask")

                            ],
                          ),
                        ),
                      ),
                    );
                  },);
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: UniVerseColours.kGray2)),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Add a subtask",
                    ),
                  ),
                ),
              ),
              gapH24,
              gapH12,
              const Text("Attachments"),
              gapH16,
              SizedBox(
                height: 60,
                child: ListView.separated(itemBuilder: (context,index){
                  if(index == 0){
                    return Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: UniVerseColours.kGray2),
                      ),
                      child: const Icon(Icons.add,color: UniVerseColours.kPurple,),
                    );
                  }else{
                    return Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(image: AssetImage(UniVerseAssets.onBoarding))
                      ),
                    );
                  }
                }, separatorBuilder: (_,__){return gapW20;}, itemCount: 3,scrollDirection: Axis.horizontal,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
