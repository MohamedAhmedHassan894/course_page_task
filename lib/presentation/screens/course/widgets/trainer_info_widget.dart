import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_size_boxes.dart';
import '../../../../utils/images.dart';
import '../../base/hearder_text.dart';

class TrainerInfoWidget extends StatelessWidget {
  const TrainerInfoWidget({
    Key? key,
    required this.trainerImg,
    required this.trainerName,
  }) : super(key: key);
  final String trainerImg;
  final String trainerName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 44.r),
      child: Row(
        children: [
          ClipOval(
            child: FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              width: 84.w,
              height: 87.w,
              imageErrorBuilder: (context, error, stackTrace) =>
                  const CircleAvatar(
                backgroundImage: AssetImage(
                  Images.personImg,
                ),
              ),
              image: trainerImg,
              fadeInDuration: const Duration(
                milliseconds: 300,
              ),
              placeholder: Images.imgPlaceHolder,
              // placeholder: kTransparentImage,
            ),
          ),
          30.widthBox,
          HeaderText(
            text: trainerName,
          ),
        ],
      ),
    );
  }
}
