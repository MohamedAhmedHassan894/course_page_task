import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/styles.dart';
class HeaderText extends StatelessWidget {
  const HeaderText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.montserratBold.copyWith(
        fontSize: 35.sp,
      ),
    );
  }
}
