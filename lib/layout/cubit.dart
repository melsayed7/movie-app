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

  List<BottomNavigationBarItem> bottomItems =
  [
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
      label: 'UpComing',
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
    UpComingScreen(),
    FavouriteScreen(),
  ];

  void changeBottomNavBar(int index,) {
    currentIndex = index;
    if (index == 0) {
      getPopularMovie();
    }
    if (index == 1) {
      getTopRateMovie();
    }
    if (index == 2) {
      getUpComingMovie();
    }
    if (index == 3) {
      FavouriteScreen();
    }
    emit(MovieBottomNavState());
  }

  List<MovieModel> popular = [];
  MovieResultModel? movieModel;

  void getPopularMovie()
  {
    // emit(PopularMovieLoadingState());
    DioHelper.getData(
        url: 'movie/popular',
        query: {
          'api_key': '58b29b46048441216fa7c3562cb5eba9',
        }
        ).then((value) {
      movieModel = MovieResultModel.fromJson(value.data);
      popular = movieModel!.results!;
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

  List<MovieModel> upComing = [];

  void getUpComingMovie()
  {
    emit(UpComingMovieLoadingState());
    DioHelper.getData(
        url: 'movie/upcoming',
        query: {
          'api_key': '58b29b46048441216fa7c3562cb5eba9',
        }).then((value) {
      movieModel = MovieResultModel.fromJson(value.data);
      upComing = movieModel!.results!;
      emit(UpComingMovieSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UpComingMovieErrorState(error));
    });
  }

  List<MovieModel> favoriteList = [];
  void addFavorite(int movieId)
  {
    var isExist = favoriteList.indexWhere((element) => element.id == movieId);
    print(isExist);
    if(isExist >= 0)
      {
        favoriteList.removeAt(isExist);
      }
    else
      {
        favoriteList.add(movieModel!.results!.firstWhere((element) => element.id == movieId));
      }
    print(favoriteList);
  }

  bool isFavorite(int movieId)
  {
   return  favoriteList.any((element) => element.id == movieId );
  }

  /*FavoriteModel? favoritesModel ;
  Map<int , bool> favorite = {};
  void getFavourite (int? movieId)
  {
    DioHelper.getData(
        url: 'movie/$movieId',
        query: {
          'api_key': '58b29b46048441216fa7c3562cb5eba9',
        })
        .then((value){
      favoritesModel = FavoriteModel.fromJson(value.data);
      print(favoritesModel?.rated);
      emit(FavoriteMovieSuccessState());
    })
        .catchError((error){
          emit(FavoriteMovieErrorState(error.toString()));
          print(error.toString());
    });

  }*/


}