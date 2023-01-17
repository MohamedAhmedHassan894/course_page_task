import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/app_size_boxes.dart';
import '../../../utils/images.dart';

class InteractiveIcons extends StatelessWidget {
  const InteractiveIcons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 44.r,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.keyboard_arrow_right,
              size: 70.sp,
            ),

            Row(
              children: [
                SvgPicture.asset(
                  Images.shareIcon,
                  color: Colors.white,
                  height: 55.h,
                  width: 52.w,
                ),
                56.widthBox,
                Icon(
                  Icons.star_border,
                  size: 60.sp,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
