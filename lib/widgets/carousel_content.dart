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
        'https://res.cloudinary.com/dafudehxr/image/upload/f_auto,q_auto/hsjxnockhmpl3jyzdy1q',
        'https://res.cloudinary.com/dafudehxr/image/upload/f_auto,q_auto/yijkuztpv7l8hzxqsvyg',
      ].map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Image.network(
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
