import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/course_model.dart';
import '../../data/repository/course_repo.dart';
import '../../helpers/logger_helper.dart';
part 'course_states.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit(this.courseRepo) : super(CourseInitial());
  final CourseRepo courseRepo;
  void getCourseData() async {
    emit(CourseLoadingDetails());
    try {
      CourseModel response = await courseRepo.getCourseData();
      LoggerHelper.logger.i(response.toJson());
      emit(CourseDataLoaded(response));
    } catch (e) {
      LoggerHelper.logger.e(e.toString());
      emit(CourseDataFailed(e.toString()));
    }
  }
}
