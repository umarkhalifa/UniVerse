import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/core/widgets/profile_picture.dart';
import 'package:uni_verse/src/core/widgets/text_field.dart';
import 'package:uni_verse/src/features/forum/presentation/providers/feed_provider.dart';
import 'package:uni_verse/src/features/home/presentation/providers/home_provider.dart';
import 'package:uni_verse/src/features/home/presentation/providers/home_state.dart';

class CreatePostScreen extends HookConsumerWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeNotifier);
    final feedState = ref.watch(feedNotifier);
    final descriptionController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UniVerseColours.kBackground,
        title: const Text(
          "Create a Post",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: (){
              if(feedState.file != '' || descriptionController.text != '' ){
                ref.read(feedNotifier.notifier).uploadPost(
                    content: descriptionController.text
                );
              }
            },
            child: feedState.appState != AppState.loading ? Text(
              "Post",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: UniVerseColours.kPurple,
              ),
            ):const CircularProgressIndicator(color: UniVerseColours.kPurple,),
          ),
          gapW16,
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Row(
                children: [
                  const ProfilePicture(),
                  gapW12,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${FirebaseAuth.instance.currentUser?.displayName}",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      Text(
                        "@${homeState.userEntity?.userName}",
                        style: TextStyle(
                          color: UniVerseColours.kGray3,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              gapH16,
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: feedState.file == ''
                    ? SizedBox(
                  height: 250,
                  child: Column(
                          children: [
                            GestureDetector(
                              onTap: ref.read(feedNotifier.notifier).selectImage,
                              child: Icon(
                                SolarIconsBold.galleryAdd,
                                color: UniVerseColours.kPurple.withOpacity(0.5),
                                size: 180,
                              ),
                            ),
                            Text(
                              "Add an image from your gallery",
                              style: TextStyle(
                                  color: UniVerseColours.kGray3, fontSize: 14.sp),
                            ),
                          ],
                        ),
                    )
                    : Container(
                  height: 450,
                  decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(File(feedState.file!)),
                            // fit: BoxFit.co,
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        child:  Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: (){
                                ref.read(feedNotifier.notifier).selectImage();
                              },
                              child: const Icon(
                                SolarIconsBold.trashBin2,
                                color: UniVerseColours.kPurple,
                                size: 28,
                              ),
                            )
                          ],
                        ),
                      ),
              ),
              gapH16,
               UniverseTextField(
                label: "Description",
                maxLines: 5,
                 controller: descriptionController,
              )
            ],
          ),
        ),
      ),
    );
  }
}
