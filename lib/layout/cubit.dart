import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/layout/states.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/shared/network/dio_helper.dart';

import '../model/movie_result_model.dart';
import '../moduel/favourite_screen.dart';
import '../moduel/popular_screen.dart';
import '../moduel/top_rate_screen.dart';
import '../moduel/trend_screen.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit() : super(MovieInitialState());

  static MovieCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.movie,
        color: Colors.black,
      ),
      label: 'Popular',
      backgroundColor: Colors.blue,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.movie,
        color: Colors.black,
      ),
      label: 'Top Rate',
      backgroundColor: Colors.blue,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.movie,
        color: Colors.black,
      ),
      label: 'Trending',
      backgroundColor: Colors.blue,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite,
        color: Colors.black,
      ),
      label: 'Favourite',
      backgroundColor: Colors.blue,
    ),
  ];

  List<Widget> Screens = [
    PopularScreen(),
    TopRateScreen(),
    TrendScreen(),
    FavouriteScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 0) {
      getPopularMovie();
    }
    if (index == 1) {
      getTopRateMovie();
    }
    if (index == 2) {
      getTrendMovie();
    }
    if (index == 3) {
      FavouriteScreen();
    }
    emit(MovieBottomNavState());
  }

  List<MovieModel> popular = [];
  Map<int , bool> favourite ={};
  MovieResultModel? movieModel;
  void getPopularMovie()
  {
   // emit(PopularMovieLoadingState());
    DioHelper.getData(
        url: 'movie/popular',
        query: {
          'api_key': '58b29b46048441216fa7c3562cb5eba9',
        }).then((value) {
          movieModel = MovieResultModel.fromJson(value.data);
          popular = movieModel!.results!;
        /*  popular.forEach((element) {
            element.id : element.
          });*/
         // print(popular);
          emit(PopularMovieSuccessState());
        }).catchError((error) {
          print(error.toString());
          emit(PopularMovieErrorState(error));
         });
  }


  List<MovieModel> topRated = [];
  void getTopRateMovie()
  {
    emit(TopRateMovieLoadingState());
    DioHelper.getData(
        url: 'movie/top_rated',
        query: {
          'api_key': '58b29b46048441216fa7c3562cb5eba9',
        }).then((value) {
      movieModel = MovieResultModel.fromJson(value.data);
      topRated = movieModel!.results!;
      emit(TopRateMovieSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(TopRateMovieErrorState(error));
    });
  }

  List<MovieModel> trend = [];
  void getTrendMovie()
  {
    emit(TrendMovieLoadingState());
    DioHelper.getData(
        url: 'trending/all/day',
        query: {
          'api_key': '58b29b46048441216fa7c3562cb5eba9',
        }).then((value) {
      movieModel = MovieResultModel.fromJson(value.data);
      trend = movieModel!.results!;
      emit(TrendMovieSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(TrendMovieErrorState(error));
    });
  }


}
