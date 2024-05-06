import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'onboarding_event.dart';
part 'onboarding_state..dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final TextEditingController controllerUsername;

  OnboardingBloc({required this.controllerUsername})
      : super(OnboardingInitial()) {
    if (controllerUsername.text.isEmpty) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(const OnboardingLoaded(buttonEnabled: true));
    } else {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(const OnboardingLoaded(buttonEnabled: false));
    }

    on<OnboardingTextField>(
      (event, emit) {
        emit(
            OnboardingLoaded(buttonEnabled: event.text.isEmpty ? true : false));
      },
    );
  }
}
