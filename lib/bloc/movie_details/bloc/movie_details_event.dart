part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object?> get props => [];
}

class FetchMovieDetails extends MovieDetailsEvent {
  final int movieId;

  const FetchMovieDetails(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
