part of 'course_cubit.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {}

class CourseLoadingDetails extends CourseState {}

class CourseDataLoaded extends CourseState {
  final CourseModel courseModel;
  CourseDataLoaded(this.courseModel);
}

class CourseDataFailed extends CourseState {
  final String error;
  CourseDataFailed(this.error);
}
