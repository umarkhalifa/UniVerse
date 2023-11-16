import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_verse/src/core/router/router_names.dart';
import 'package:uni_verse/src/features/authentication/presentation/auth_screens.dart';
import 'package:uni_verse/src/features/authentication/presentation/screens/forgot_password.dart';
import 'package:uni_verse/src/features/authentication/presentation/screens/splash_screen.dart';
import 'package:uni_verse/src/features/forum/domain/entity/tweet.dart';
import 'package:uni_verse/src/features/forum/presentation/screens/comment_screen.dart';
import 'package:uni_verse/src/features/forum/presentation/screens/create_post.dart';
import 'package:uni_verse/src/features/forum/presentation/screens/image_viewer.dart';
import 'package:uni_verse/src/features/home/domain/entities/course.dart';
import 'package:uni_verse/src/features/home/presentation/screens/course_details.dart';
import 'package:uni_verse/src/features/home/presentation/screens/courses_screen.dart';
import 'package:uni_verse/src/features/home/presentation/screens/home_screen.dart';
import 'package:uni_verse/src/features/home/presentation/screens/pdf_view.dart';
import 'package:uni_verse/src/features/navigation/bottom_navigation.dart';
import 'package:uni_verse/src/features/profile/presentation/screens/change_password_screen.dart';
import 'package:uni_verse/src/features/profile/presentation/screens/edit_profile.dart';
import 'package:uni_verse/src/features/tasks/presentation/screens/add_task_screen.dart';
import 'package:uni_verse/src/features/tasks/presentation/screens/task_details.dart';
import 'package:uni_verse/src/features/tasks/presentation/screens/tasks_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider(
  (ref) {
    // final authState = ref.watch(authStateNotifier);
    return GoRouter(
      navigatorKey: navigatorKey,
      // debugLogDiagnostics: true,
      initialLocation: '/',
      routes: [
        GoRoute(
            path: '/',
            name: RouterNames.splash.name,
            builder: (context, state) => const SplashScreen()),
        GoRoute(
            path: '/onBoarding',
            name: RouterNames.onBoarding.name,
            builder: (context, state) => const OnBoardingScreen()),
        GoRoute(
            path: '/login',
            name: RouterNames.login.name,
            builder: (context, state) => const LoginScreen()),
        GoRoute(
            path: '/forgotPassword',
            name: RouterNames.forgotPassword.name,
            builder: (context, state) => const ForgotPasswordScreen()),
        GoRoute(
            path: '/register',
            name: RouterNames.register.name,
            builder: (context, state) => const RegisterScreen()),
        GoRoute(
            path: '/selectGender',
            name: RouterNames.selectGender.name,
            builder: (context, state) => const SelectGenderScreen()),
        GoRoute(
            path: '/navigation',
            name: RouterNames.navigation.name,
            builder: (context, state) => const NavigationLayOut()),
        GoRoute(
            path: '/home',
            name: RouterNames.home.name,
            builder: (context, state) => const HomeScreen()),
        GoRoute(
            path: '/comment',
            name: RouterNames.comments.name,
            builder: (context, state) {
              final tweet = state.extra as Tweet;
              return CommentScreen(
                feed: tweet,
              );
            }),
        GoRoute(
            path: '/imageView',
            name: RouterNames.imageView.name,
            builder: (context, state) {
              final value = state.extra as Map<String, dynamic>;
              return ImageViewer(
                image: value['image'],
                tweetId: value['id'],
              );
            }),
        GoRoute(
            path: '/createPost',
            name: RouterNames.createPost.name,
            builder: (context, state) => const CreatePostScreen()),
        GoRoute(
            path: '/courses',
            name: RouterNames.courses.name,
            builder: (context, state) => const CoursesScreen()),
        GoRoute(
            path: '/changePassword',
            name: RouterNames.changePassword.name,
            builder: (context, state) => const ChangePasswordScreen()),
        GoRoute(
            path: '/editProfile',
            name: RouterNames.editProfile.name,
            builder: (context, state) => const EditProfileScreen()),
        GoRoute(
            path: '/pdfView',
            name: RouterNames.pdfView.name,
            builder: (context, state) {
              final value = state.extra as String;
              return PdfViewScreen(
                link: value,
              );
            }),
        GoRoute(
          path: '/courseDetails',
          name: RouterNames.courseDetail.name,
          builder: (context, state) {
            final course = state.extra! as Course;
            return CourseDetails(course: course);
          },
        ),
        GoRoute(
            path: '/tasks',
            name: RouterNames.tasks.name,
            builder: (context, state) => const TasksScreen()),
        GoRoute(
            path: '/addTask',
            name: RouterNames.addTask.name,
            builder: (context, state) => const AddTaskScreen()),
        GoRoute(
            path: '/taskDetails',
            name: RouterNames.taskDetails.name,
            builder: (context, state) => const TaskDetails())

      ],
    );
  },
);

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
