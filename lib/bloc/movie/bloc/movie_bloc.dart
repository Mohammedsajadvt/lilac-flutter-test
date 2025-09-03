import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/data/service/api_service.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final ApiService apiService;

MovieBloc({required this.apiService}) : super(const MovieState()){
    on<FetchNowPlaying>(_onFetchNowPlaying);
    on<FetchTrending>(_onFetchTrending);
    on<FetchUpcoming>(_onFetchUpcoming);
  }

  Future<void> _onFetchNowPlaying(FetchNowPlaying event, Emitter<MovieState> emit) async {
    emit(state.copyWith(loading: true));
    try {
      final movies = await apiService.fetchNowPlaying();
      emit(state.copyWith(nowPlaying: movies, loading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), loading: false));
    }
  }

  Future<void> _onFetchTrending(FetchTrending event, Emitter<MovieState> emit) async {
    emit(state.copyWith(loading: true));
    try {
      final movies = await apiService.fetchTrending();
      emit(state.copyWith(trending: movies, loading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), loading: false));
    }
  }

  Future<void> _onFetchUpcoming(FetchUpcoming event, Emitter<MovieState> emit) async {
    emit(state.copyWith(loading: true));
    try {
      final movies = await apiService.fetchUpcoming();
      emit(state.copyWith(upcoming: movies, loading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), loading: false));
    }
  }
}
