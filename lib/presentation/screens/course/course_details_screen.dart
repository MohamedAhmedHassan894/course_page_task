import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_page_task/presentation/base/divider_line.dart';
import 'package:course_page_task/presentation/screens/widgets/header_widget.dart';
import 'package:course_page_task/utils/app_palette.dart';
import 'package:course_page_task/utils/app_size_boxes.dart';
import 'package:course_page_task/utils/dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../business_logic/cubit/course_cubit.dart';
import '../../../data/repository/course_repo.dart';
import '../../../data/webservices/course_webservices.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';
import '../../../utils/transparent_image.dart';
import '../../base/error_message.dart';
import '../../base/loading_widget.dart';

class CourseDetailsScreen extends StatelessWidget {
  CourseDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => CourseCubit(
        CourseRepo(
          CourseWebservices(),
        ),
      )..getCourseData(),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: BlocBuilder<CourseCubit, CourseState>(
          builder: (context, state) {
            if (state is CourseLoadingDetails) {
              return const LoadingWidget();
            } else if (state is CourseDataLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderWidget(),
                  Padding(
                    padding: EdgeInsets.all(12.0.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '# ${state.courseModel.interest ?? '#'}',
                          style: AppTextStyles.montserratSemiBold.copyWith(
                            fontSize: Dimensions.fontSizeLarge,
                          ),
                        ),
                        8.heightBox,
                        Text(
                          state.courseModel.trainerInfo ?? '-',
                          style: AppTextStyles.montserratBold.copyWith(
                              fontSize: Dimensions.fontSizeLarge,
                              color: Colors.black87),
                        ),
                        8.heightBox,
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: AppPalette.headerTextColor,
                            ),
                            6.widthBox,
                            Text(
                              state.courseModel.date ?? '-',
                              style: AppTextStyles.montserratSemiBold.copyWith(
                                fontSize: Dimensions.fontSizeLarge,
                              ),
                            ),
                          ],
                        ),
                        8.heightBox,
                        Row(
                          children: [
                            const Icon(
                              Icons.location_pin,
                              color: AppPalette.headerTextColor,
                            ),
                            6.widthBox,
                            Text(
                              state.courseModel.address ?? '-',
                              style: AppTextStyles.montserratSemiBold.copyWith(
                                fontSize: Dimensions.fontSizeLarge,
                              ),
                            ),
                          ],
                        ),
                        8.heightBox,
                        DividerLine(
                          widthPercent: 2,
                          height: 1.h,
                        )
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const ErrorMessage();
            }
          },
        ),
      ),
    );
  }
}
