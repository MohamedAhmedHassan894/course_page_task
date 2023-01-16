import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'helpers/app_router.dart';
import 'helpers/bloc_observer.dart';
import 'helpers/dio_helper.dart';
import 'helpers/logger_helper.dart';
import 'themes/light_theme.dart';
import 'utils/strings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LoggerHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        onGenerateRoute: appRouter.generateRoute,
        theme: lightTheme,
      ),
    );
  }
}
