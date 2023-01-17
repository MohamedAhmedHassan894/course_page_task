import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_palette.dart';
import '../../../utils/strings.dart';
import '../../../utils/styles.dart';

class BookButton extends StatelessWidget {
  const BookButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Ink(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppPalette.buttonColorWeight,
              AppPalette.buttonColorLight,
              AppPalette.buttonColorMedium,
            ],
          ),
        ),
        child: Container(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: 143.h,
          ),
          alignment: Alignment.center,
          child: Text(
            AppStrings.bookNow,
            style: AppTextStyles.montserratBold.copyWith(
              color: Colors.white,
              fontSize: 40.sp,
            ),
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
