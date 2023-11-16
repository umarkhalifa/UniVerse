import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/features/forum/presentation/screens/forum_screen.dart';
import 'package:uni_verse/src/features/home/presentation/screens/home_screen.dart';
import 'package:uni_verse/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:uni_verse/src/features/schedule/presentation/screens/schedule_screen.dart';
List<Widget> screens =[
  const HomeScreen(),
  const ScheduleScreen(),
  const ForumScreen(),
  // const TasksScreen(),
  const ProfileScreen(),
];


class NavigationLayOut extends StatefulWidget {
  const NavigationLayOut({super.key});

  @override
  State<NavigationLayOut> createState() => _NavigationLayOutState();
}

class _NavigationLayOutState extends State<NavigationLayOut> {
  ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, index, child) {
        return Scaffold(
          body: screens[index],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(index == 0
                      ? SolarIconsBold.home
                      : SolarIconsOutline.home),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(index == 1
                      ? SolarIconsBold.calendar
                      : SolarIconsOutline.calendar),
                  label: 'Schedule'),
              BottomNavigationBarItem(
                  icon: Icon(index == 2
                      ? SolarIconsBold.chatDots
                      : SolarIconsOutline.chatDots),
                  label: 'Forum'),
              // BottomNavigationBarItem(
              //     icon: Icon(index == 3
              //         ? SolarIconsBold.document1
              //         : SolarIconsOutline.document1),
              //     label: 'Forum'),
              BottomNavigationBarItem(
                  icon: Icon(index == 3
                      ? SolarIconsBold.user
                      : SolarIconsOutline.user),
                  label: 'Profile'),
            ],
            showSelectedLabels: false,
            selectedItemColor: UniVerseColours.kPurple,
            unselectedItemColor: UniVerseColours.kGray,
            currentIndex: index,
            onTap: (value){
              currentIndex.value = value;
            },
          ),
        );
      },
      valueListenable: currentIndex,
    );
  }
}
