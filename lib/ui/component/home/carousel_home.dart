import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselImage extends StatelessWidget {
  CarouselImage({Key? key});

  final List<ImageCarousel> imageList = [
    ImageCarousel('assets/images/loading_1.jpg'),
    ImageCarousel('assets/images/loading_2.jpg'),
    ImageCarousel('assets/images/loading_3.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imageList.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width: 0,
                ),
              ),
              width: Get.width,
              height: Get.height * 0.245,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  image.image,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: Get.height * 0.245,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: MediaQuery.of(context).size.aspectRatio,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
      ),
    );
  }
}

class ImageCarousel {
  String image;
  ImageCarousel(this.image);
}
