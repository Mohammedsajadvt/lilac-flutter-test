import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertest/data/models/movie_details_model.dart';
import 'package:fluttertest/data/service/api_service.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final ApiService apiService;

  MovieDetailsBloc({required this.apiService})
      : super(const MovieDetailsState()) {
    on<FetchMovieDetails>((event, emit) async {
      // Start loading, clear old error & movie
      emit(state.copyWith(
        loading: true,
        clearError: true,
        clearMovie: true,
      ));

      try {
        final movie = await apiService.fetchMovieDetails(event.movieId);
        emit(state.copyWith(
          loading: false,
          movie: movie,
        ));
      } catch (e) {
        emit(state.copyWith(
          loading: false,
          error: e.toString(),
          clearMovie: true,
        ));
      }
    });
  }
}
