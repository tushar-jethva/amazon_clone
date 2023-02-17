import 'package:amazon_clone/costants/globalvariables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyCarouselImage extends StatelessWidget {
  const MyCarouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: MyGlobalVariables.carouselImages.map((i) {
          return Builder(
              builder: (BuildContext context) => 
              CachedNetworkImage(
                    imageUrl: i,
                    fit: BoxFit.cover,
                    height: 200,
                    placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
                  ));
           //Image.network(i, fit: BoxFit.cover, height: 200));
        }).toList(),
        options: CarouselOptions(
          viewportFraction: 1,
          height: 200,
          autoPlay: true,
          scrollDirection: Axis.horizontal,
          autoPlayAnimationDuration: Duration(milliseconds: 500),
          pauseAutoPlayOnTouch: false,
        ));
  }
}
