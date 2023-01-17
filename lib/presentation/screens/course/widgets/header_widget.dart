import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../utils/app_size_boxes.dart';
import '../../../../utils/images.dart';
import '../../base/interactive_icons.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

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
      alignment: Alignment.bottomLeft,
      children: [
        CarouselSlider(
          carouselController: carouselController,
          items: courselImages
              .map(
                (image) => FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  imageErrorBuilder: (context, error, stackTrace) => Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(
                          image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  image: image,
                  fadeInDuration: const Duration(
                    milliseconds: 300,
                  ),
                  placeholder: Images.imgPlaceHolder,
                ),
              )
              .toList(),
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            onPageChanged: (index, _) {
              setState(
                () {
                  carouselIndex = index;
                },
              );
            },
            viewportFraction: 1,
            enlargeCenterPage: false,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: false,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Positioned(
          top: 100.h,
          right: 0,
          left: 0,
          child: const InteractiveIcons(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 44.r,
            vertical: 39.r,
          ),
          child: SizedBox(
            height: 30.h,
            child: ListView.separated(
              itemCount: courselImages.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Container(
                height: carouselIndex == index ? 27.h : 20.h,
                width: carouselIndex == index ? 27.h : 20.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: carouselIndex == index
                      ? Colors.white
                      : Colors.white.withOpacity(.6),
                ),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  10.widthBox,
            ),
          ),
        ),
      ],
    );
  }
}
