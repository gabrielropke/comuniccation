part of 'onboarding_bloc.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class OnboardingInitial extends OnboardingState {}

class OnboardingLoaded extends OnboardingState {
  final bool buttonEnabled;

  const OnboardingLoaded({required this.buttonEnabled});

  @override
  List<Object> get props => [buttonEnabled];
}
