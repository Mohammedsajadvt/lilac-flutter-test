import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object?> get props => [];
}

/// Fetch Now Playing
class FetchNowPlaying extends MovieEvent {}

/// Fetch Trending
class FetchTrending extends MovieEvent {}

/// Fetch Upcoming
class FetchUpcoming extends MovieEvent {}
