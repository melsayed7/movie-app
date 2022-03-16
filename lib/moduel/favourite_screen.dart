import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/model/movie_model.dart';

import '../layout/cubit.dart';
import '../layout/states.dart';
import '../shared/components/widget_component.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MovieCubit.get(context);
        if(cubit.favoriteList.isEmpty)
          {
            return const Center(
                child: Text(
                  'No Favorite Movie',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                  ),
                ));
          }
        else
          {
            return ListView.separated(
              itemBuilder: (context, index) {
                return buildFavoriteItem(cubit.favoriteList[index],context,cubit.favoriteList[index].id);
              },
              separatorBuilder: (context, index) =>
              const Divider(thickness: 1, color: Colors.black),
              itemCount: cubit.favoriteList.length,
            );
          }
      },
    );
  }

  Widget buildFavoriteItem(MovieModel model, context,int? movieId) => Padding(
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
                      'https://image.tmdb.org/t/p/w600_and_h900_bestv2${model.backdropPath}'),
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
                        '${model.overview}',
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
                            '${model.title}',
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(.3),
                            child: IconButton(
                              onPressed: () {
                                MovieCubit.get(context).addFavorite(movieId!);
                              },
                              icon:
                                  const Icon(Icons.favorite, color: Colors.red),
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
      );
}


