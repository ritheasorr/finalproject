import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: false,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
        autoPlayAnimationDuration: Duration(milliseconds: 3000),
      ),
      items: [
        'assets/images/first.png',
        'assets/images/Wrack-post.png',
        'assets/images/Fence.png',
        'assets/images/two.png',
        'assets/images/three.png',
      ].map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            );
          },
        );
      }).toList(),
    );
  }
}
