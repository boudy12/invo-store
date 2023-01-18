import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/layout/cubit/states.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:invostore1/models/images.dart';

class CarouselSliderScreen extends StatelessWidget {

  List<ImagesModel> images ;

  CarouselSliderScreen({Key? key , required this.images}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images.map((e) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(e.image),
              fit: BoxFit.cover,
            )
        ),
      )).toList(),
      options: CarouselOptions(
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(
            seconds: 3
        ),
        autoPlayAnimationDuration: const Duration(
            seconds: 1
        ),
        initialPage: 0,
        height:200,
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
        viewportFraction: 1,
        enableInfiniteScroll: true,
      ),
    );
  }
}
