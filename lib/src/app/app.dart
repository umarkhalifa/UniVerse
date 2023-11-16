import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/core/constants/theme.dart';
import 'package:uni_verse/src/core/router/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UniVerseApp extends ConsumerWidget {
  const UniVerseApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(themeProvider);
    final router = ref.watch(routerProvider);
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        theme: theme,
        routerConfig: router,
        debugShowCheckedModeBanner: false,

      ),
    );
  }
}
