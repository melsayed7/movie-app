import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../model/movie_model.dart';

class BackgroundMovie extends StatefulWidget {

  String? imageUrl ;
  BackgroundMovie({required this.imageUrl});

  @override
  _BackgroundMovieState createState() => _BackgroundMovieState();
}

class _BackgroundMovieState extends State<BackgroundMovie> {

 // MovieModel? model;
  //CarouselController carouselController = CarouselController();
  int currentPage =0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:
      [
        CarouselSlider.builder(
            itemCount: 3,
            //carouselController: carouselController,
            options: CarouselOptions(
              height: 400,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 5),
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                });
              },
            ) ,
            itemBuilder: (context, index, realIndex) => Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://image.tmdb.org/t/p/w600_and_h900_bestv2${widget.imageUrl}'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            ),

        ),
        Positioned(
          bottom: 30,
          left: 140,
          child: AnimatedSmoothIndicator(
            activeIndex: currentPage,
            count: 3,
            effect: const ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Colors.white,
                dotColor: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
