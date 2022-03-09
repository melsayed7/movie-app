abstract class MovieStates{}

class MovieInitialState extends MovieStates {}

class MovieBottomNavState extends MovieStates {}

class PopularMovieLoadingState extends MovieStates {}

class PopularMovieSuccessState extends MovieStates {}

class PopularMovieErrorState extends MovieStates {

  final String error ;
  PopularMovieErrorState(this.error);
}

class TopRateMovieLoadingState extends MovieStates {}

class TopRateMovieSuccessState extends MovieStates {}

class TopRateMovieErrorState extends MovieStates {

  final String error ;
  TopRateMovieErrorState(this.error);
}

class TrendMovieLoadingState extends MovieStates {}

class TrendMovieSuccessState extends MovieStates {}

class TrendMovieErrorState extends MovieStates {

  final String error ;
  TrendMovieErrorState(this.error);
}