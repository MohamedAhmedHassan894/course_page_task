import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_page_task/lib/presentation/base/error_message.dart';
import 'package:course_page_task/lib/presentation/base/loading_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../business_logic/cubit/course_cubit.dart';
import '../../../data/repository/course_repo.dart';
import '../../../data/webservices/course_webservices.dart';
import '../../../utils/images.dart';
import '../../../utils/transparent_image.dart';

class CourseDetailsScreen extends StatelessWidget {
  CourseDetailsScreen({Key? key}) : super(key: key);
  final List<String> courseImages = [
    Images.sliderImg1,
    Images.sliderImg2,
    Images.sliderImg3,
    Images.sliderImg4,
  ];

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
        body: BlocBuilder<CourseCubit, CourseState>(
          builder: (context, state) {
            if (state is CourseLoadingDetails) {
              return const LoadingWidget();
            } else if (state is CourseDataLoaded) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: Column(

                  children: [
                    // CarouselSlider(
                    //   items: courseImages
                    //       .map((image) => ClipRRect(
                    //             borderRadius: BorderRadius.circular(20),
                    //             child: FadeInImage.memoryNetwork(
                    //               fit: BoxFit.cover,
                    //               width: double.infinity,
                    //               imageErrorBuilder: (context, error, stackTrace) =>
                    //                   Image(
                    //                 image: ExactAssetImage(
                    //                   image,
                    //                 ),
                    //                 fit: BoxFit.cover,
                    //                 width: double.infinity,
                    //               ),
                    //               image: image,
                    //               fadeInDuration: const Duration(
                    //                 milliseconds: 300,
                    //               ),
                    //               placeholder: kTransparentImage,
                    //             ),
                    //           ))
                    //       .toList(),
                    //   options: CarouselOptions(
                    //     height: 200,
                    //     viewportFraction: .8,
                    //     enlargeCenterPage: true,
                    //     initialPage: 0,
                    //     enableInfiniteScroll: true,
                    //     autoPlay: true,
                    //     autoPlayInterval: const Duration(seconds: 3),
                    //     autoPlayAnimationDuration: const Duration(seconds: 1),
                    //     autoPlayCurve: Curves.fastOutSlowIn,
                    //     scrollDirection: Axis.horizontal,
                    //   ),
                    // ),
                    Column(
                      children: [Text(state.courseModel.interest ?? '')],
                    )
                  ],
                ),
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
