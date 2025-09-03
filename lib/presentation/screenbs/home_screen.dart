import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/bloc/movie/bloc/movie_bloc.dart';
import 'package:fluttertest/bloc/movie/bloc/movie_event.dart';
import 'package:fluttertest/bloc/movie/bloc/movie_state.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    final bloc = context.read<MovieBloc>();
    bloc.add(FetchNowPlaying());
    bloc.add(FetchTrending());
    bloc.add(FetchUpcoming());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state.loading && state.nowPlaying.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.error.isNotEmpty) {
            return Center(
              child: Text(state.error, style: const TextStyle(color: Colors.red)),
            );
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔹 Section 1: Latest Movies (Carousel)
                if (state.nowPlaying.isNotEmpty) ...[
                  CarouselSlider.builder(
                    itemCount: state.nowPlaying.length,
                    itemBuilder: (context, index, realIdx) {
                      final movie = state.nowPlaying[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500${movie['poster_path']}",
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 250,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() => _currentIndex = index);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: state.nowPlaying.asMap().entries.map((entry) {
                      return Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == entry.key ? Colors.red : Colors.grey,
                        ),
                      );
                    }).toList(),
                  ),
                ],

                /// 🔹 Section 2: Trending
                _buildSection("Trending Movies Near You", state.trending),

                /// 🔹 Section 3: Upcoming
                _buildSection("Upcoming Movies", state.upcoming),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSection(String title, List movies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(title,
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Container(
                width: 120,
                margin: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w500${movie['poster_path']}",
                        height: 140,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      movie['title'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
