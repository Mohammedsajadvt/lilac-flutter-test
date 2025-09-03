import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/bloc/movie/bloc/movie_bloc.dart';
import 'package:fluttertest/bloc/onboarding/onboarding_cubit.dart';
import 'package:fluttertest/data/service/api_service.dart';
import 'package:fluttertest/presentation/screenbs/booking_success.dart';
import 'package:fluttertest/presentation/screenbs/home_screen.dart';
import 'package:fluttertest/presentation/screenbs/movie_details_screen.dart';
import 'package:fluttertest/presentation/screenbs/onboarding_screen.dart';
import 'package:fluttertest/presentation/screenbs/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocProvider(create: (_)=> OnboardingCubit()),
         BlocProvider(
          create: (_) => MovieBloc(apiService: ApiService(),),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
           '/': (context) => const SplashScreen(),
           '/profile':(context) => OnboardingScreen(),
           '/home':(context) => HomeScreen(),
           '/movieDetails':(context)=>MovieDetailsScreen(),
           '/BookingSuccess':(context)=> BookingSuccess()
        },
      ),
    );
  }
}
