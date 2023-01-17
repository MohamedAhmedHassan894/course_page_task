import 'helpers/app_router.dart';
import 'helpers/dio_helper.dart';
import 'helpers/logger_helper.dart';
import 'themes/light_theme.dart';
import 'utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LoggerHelper.init();
  DioHelper.init();
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
      designSize: const Size(1080, 2277),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("ar"),
        ],
        locale: const Locale(
          "ar",
        ),
        title: AppStrings.appName,
        onGenerateRoute: appRouter.generateRoute,
        theme: lightTheme,
      ),
    );
  }
}
