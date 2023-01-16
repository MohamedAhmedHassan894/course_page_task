import 'package:dio/dio.dart';
import '../../helpers/dio_helper.dart';
import '../../utils/app_constants.dart';

class CourseWebservices {
  Future<dynamic> getCourseData() async {
    try {
      Response response = await DioHelper.getData(
        uri: AppConstants.courseDetailsUri,
      );
      return response.data;
    } catch (error) {
      return Future.error(
        "course get data error  ",
        StackTrace.fromString(
          ('this is its trace'),
        ),
      );
    }
  }
}
