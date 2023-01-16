import 'dart:async';
import '../models/course_model.dart';
import '../webservices/course_webservices.dart';

class CourseRepo {
  final CourseWebservices courseWebservices;
  CourseRepo(this.courseWebservices);
  Future<CourseModel> getCourseData() async {
    final courseDataResponse = await courseWebservices.getCourseData();
    return CourseModel.fromJson(courseDataResponse);
  }
}
