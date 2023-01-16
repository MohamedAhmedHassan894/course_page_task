import 'package:flutter/material.dart';
import '../presentation/screens/course/course_details_screen.dart';
import '../utils/app_constants.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppConstants.courseDetailsScreen:
        return MaterialPageRoute(builder: (_) => CourseDetailsScreen());
    }
    return null;
  }
}
