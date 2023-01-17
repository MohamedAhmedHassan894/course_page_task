import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/course_details_widget.dart';
import '../../../business_logic/cubit/course_cubit.dart';
import '../../../data/repository/course_repo.dart';
import '../../../data/webservices/course_webservices.dart';
import '../../base/error_message.dart';
import '../../base/loading_widget.dart';
import 'widgets/header_widget.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseCubit(
        CourseRepo(
          CourseWebservices(),
        ),
      )..getCourseData(),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 675.h,
              floating: true,
              pinned: true,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              flexibleSpace: const FlexibleSpaceBar(
                background: HeaderWidget(),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, position) {
                  return SingleChildScrollView(
                    child: BlocBuilder<CourseCubit, CourseState>(
                      builder: (context, state) {
                        if (state is CourseLoadingDetails) {
                          return const LoadingWidget();
                        } else if (state is CourseDataLoaded) {
                          return CourseDetailsWidget(
                            course: state.courseModel,
                          );
                        } else {
                          return const ErrorMessage();
                        }
                      },
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
