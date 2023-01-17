import 'package:course_page_task/data/models/course_model.dart';
import 'package:course_page_task/utils/app_size_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../utils/app_palette.dart';
import '../../../../utils/images.dart';
import '../../../../utils/strings.dart';
import '../../../../utils/styles.dart';
import '../../../base/divider_line.dart';
import '../../../base/error_message.dart';
import '../../base/book_button.dart';
import '../../base/hearder_text.dart';
import 'booking_row_item.dart';
import 'trainer_info_widget.dart';

class CourseDetailsWidget extends StatelessWidget {
  const CourseDetailsWidget({Key? key, required this.course}) : super(key: key);
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 44.r,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 44.r),
            child: Text(
              '# ${course.interest ?? '#'}',
              style: AppTextStyles.montserratSemiBold.copyWith(
                fontSize: 35.sp,
                color: AppPalette.subTitleTextColor,
              ),
            ),
          ),
          34.heightBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 44.r),
            child: Text(
              course.trainerInfo ?? '-',
              style: AppTextStyles.montserratBold.copyWith(
                fontSize: 42.sp,
                color: Colors.grey[900],
              ),
            ),
          ),
          36.heightBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 44.r),
            child: Row(
              children: [
                SvgPicture.asset(
                  Images.calenderIcon,
                  color: AppPalette.subTitleTextColor,
                  height: 55.h,
                  width: 52.w,
                ),
                21.widthBox,
                Text(
                  course.date ?? '-',
                  style: AppTextStyles.montserratSemiBold.copyWith(
                    fontSize: 35.sp,
                    color: AppPalette.subTitleTextColor,
                  ),
                ),
              ],
            ),
          ),
          41.heightBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 44.r),
            child: Row(
              children: [
                SvgPicture.asset(
                  Images.pinIcon,
                  color: AppPalette.subTitleTextColor,
                  height: 55.h,
                  width: 52.w,
                ),
                21.widthBox,
                Text(
                  course.address ?? '-',
                  style: AppTextStyles.montserratSemiBold.copyWith(
                      fontSize: 35.sp, color: AppPalette.subTitleTextColor),
                ),
              ],
            ),
          ),
          const DividerLine(
            widthPercent: 2,
          ),
          TrainerInfoWidget(
            trainerImg: course.trainerImg ?? '',
            trainerName: course.trainerName ?? '-',
          ),
          21.heightBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 44.r),
            child: Text(
              '${course.trainerInfo ?? 'مدرب البرنامج'} ، ايضا مدرب معتمد ويتميز بقدرته علي إيصال المعلومة بدقة وببساطة .',
              style: AppTextStyles.montserratSemiBold.copyWith(
                  fontSize: 35.sp, color: AppPalette.subTitleTextColor),
            ),
          ),
          const DividerLine(
            widthPercent: 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 44.r),
            child: const HeaderText(
              text: AppStrings.courseInfo,
            ),
          ),
          30.widthBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 44.r),
            child: Text(
              course.occasionDetail ?? '-',
              style: AppTextStyles.montserratSemiBold.copyWith(
                fontSize: 35.sp,
                color: AppPalette.subTitleTextColor,
              ),
            ),
          ),
          const DividerLine(
            widthPercent: 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:44.r),
            child: const HeaderText(
              text: AppStrings.coursePackage,
            ),
          ),
          10.heightBox,
          if (course.reservTypes == null || course.reservTypes!.isEmpty)
            const ErrorMessage()
          else
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              children: course.reservTypes!
                  .map(
                    (type) => BookingRowItem(
                      label: type.name ?? AppStrings.normalBooking,
                      salary: type.price.toString(),
                    ),
                  )
                  .toList(),
            ),
          109.heightBox,
          const BookButton(),
        ],
      ),
    );
  }
}
