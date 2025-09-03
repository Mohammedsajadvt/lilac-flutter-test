import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState());

  void changePage(int index) {
    emit(state.copyWith(currentPage: index));
  }

  void nextPage(int totalPages, PageController controller, Function onFinished) {
    if (state.currentPage < totalPages - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      onFinished();
    }
  }
}
