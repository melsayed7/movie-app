import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

class MovieInfo extends StatelessWidget {

   String? title;
  //final int movieId;
   double? voteAverage ;
   String? overview;

   MovieInfo({
     required this.title,
     required this.overview,
     required this.voteAverage,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Column(
        children:
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
            [
               Expanded(
                child:
                Text(
                  title!,
                  style:const  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                   // color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(.3),
                child: IconButton(
                  onPressed: () {/*controller.manageFavourites(productId);*/},
                  icon: false
                      ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                      : const Icon(
                    Icons.favorite_outline,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          Row(
            children:
            [
              Text(
                "$voteAverage",
                style:const  TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  // color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(width: 8,),
              RatingBarIndicator(
                rating: voteAverage!,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 10,
                itemSize: 20.0,
                direction: Axis.horizontal,
              ),
            ],
          ),
          const SizedBox(height: 10,),
          ReadMoreText(
            overview!,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            trimMode: TrimMode.Line,
            lessStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            moreStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
