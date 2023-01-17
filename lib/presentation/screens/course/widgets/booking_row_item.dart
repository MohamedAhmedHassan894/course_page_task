import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_palette.dart';
import '../../../../utils/styles.dart';

class BookingRowItem extends StatelessWidget {
  BookingRowItem({
    Key? key,
    required this.salary,
    required this.label,
  }) : super(key: key);
  final String salary;
  String? label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 44.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label!,
            style: AppTextStyles.montserratSemiBold.copyWith(
              fontSize: 35.sp,
              color: AppPalette.subTitleTextColor,
            ),
          ),
          Text(
            'SAR $salary',
            style: AppTextStyles.montserratSemiBold.copyWith(
              fontSize: 35.sp,
              color: AppPalette.subTitleTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
