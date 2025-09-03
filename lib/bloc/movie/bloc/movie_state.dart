import 'package:equatable/equatable.dart';

class MovieState extends Equatable {
  final List<dynamic> nowPlaying;
  final List<dynamic> trending;
  final List<dynamic> upcoming;
  final bool loading;
  final String error;

  const MovieState({
    this.nowPlaying = const [],
    this.trending = const [],
    this.upcoming = const [],
    this.loading = false,
    this.error = "",
  });

  MovieState copyWith({
    List<dynamic>? nowPlaying,
    List<dynamic>? trending,
    List<dynamic>? upcoming,
    bool? loading,
    String? error,
  }) {
    return MovieState(
      nowPlaying: nowPlaying ?? this.nowPlaying,
      trending: trending ?? this.trending,
      upcoming: upcoming ?? this.upcoming,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [nowPlaying, trending, upcoming, loading, error];
}
