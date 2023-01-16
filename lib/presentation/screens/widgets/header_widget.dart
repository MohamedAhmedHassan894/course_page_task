import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_page_task/utils/app_size_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/images.dart';
import '../../../utils/transparent_image.dart';

class HeaderWidget extends StatefulWidget {
  HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  CarouselController carouselController = CarouselController();

  final List<String> courselImages = [
    Images.sliderImg1,
    Images.sliderImg2,
    Images.sliderImg3,
    Images.sliderImg4,
  ];

  int carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: carouselController,
          items: courselImages
              .map((image) => FadeInImage.memoryNetwork(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    imageErrorBuilder: (context, error, stackTrace) =>
                        Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage(
                            image,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * .04,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    carouselController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.linear);
                                  },
                                  child: IgnorePointer(
                                    child: Icon(
                                      Icons.keyboard_arrow_right,
                                      size: 35.sp,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.0.r,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.share_outlined,
                                        size: 25.sp,
                                      ),
                                      15.widthBox,
                                      Icon(
                                        Icons.star_border_outlined,
                                        size: 25.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.0.r,
                              ),
                              child: SizedBox(
                                height: 10.h,
                                child: ListView.separated(
                                  itemCount: courselImages.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) => Container(
                                    height:
                                        carouselIndex == index ? 18.h : 10.h,
                                    width: carouselIndex == index ? 18.h : 10.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: carouselIndex == index
                                          ? Colors.white
                                          : Colors.grey,
                                    ),
                                  ),
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          4.widthBox,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    image: image,
                    fadeInDuration: const Duration(
                      milliseconds: 300,
                    ),
                    placeholder: kTransparentImage,
                  ))
              .toList(),
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * .3,
            onPageChanged: (index, _) {
              carouselIndex = index;
            },
            viewportFraction: 1,
            enlargeCenterPage: false,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: false,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
