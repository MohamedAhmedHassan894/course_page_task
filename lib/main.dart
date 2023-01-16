import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'lib/helpers/app_router.dart';
import 'lib/helpers/dio_helper.dart';
import 'lib/helpers/logger_helper.dart';
import 'lib/themes/light_theme.dart';
import 'lib/utils/strings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LoggerHelper.init();
  DioHelper.init();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
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
