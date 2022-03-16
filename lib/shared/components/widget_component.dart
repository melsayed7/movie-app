import 'package:flutter/material.dart';

import '../../layout/cubit.dart';
import '../../model/movie_model.dart';
import '../../moduel/movie_details.dart';

Widget buildMovie(
  MovieModel? model,
  context,
  int? movieId
) =>
    InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetails(model!),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w600_and_h900_bestv2${model?.backdropPath}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 18.0,
            ),
            Expanded(
              child: SizedBox(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${model?.overview}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${model?.title}',
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(.3),
                            child: IconButton(
                              onPressed: () {
                                MovieCubit.get(context).addFavorite(movieId!);
                              },
                              icon: MovieCubit.get(context).isFavorite(movieId!)
                                  ? const Icon(Icons.favorite, color: Colors.red)
                                  : const Icon(Icons.favorite_outline, color: Colors.black) ,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
