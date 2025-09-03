part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final bool loading;
  final MovieDetailModel? movie;
  final String error;

  const MovieDetailsState({
    this.loading = false,
    this.movie,
    this.error = "",
  });

  MovieDetailsState copyWith({
    bool? loading,
    MovieDetailModel? movie,
    String? error,
    bool clearMovie = false,
    bool clearError = false,
  }) {
    return MovieDetailsState(
      loading: loading ?? this.loading,
      movie: clearMovie ? null : (movie ?? this.movie),
      error: clearError ? "" : (error ?? this.error),
    );
  }

  @override
  List<Object?> get props => [loading, movie, error];
}
