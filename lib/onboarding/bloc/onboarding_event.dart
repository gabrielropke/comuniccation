part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class OnboardingTextField extends OnboardingEvent {
  final String text;

  const OnboardingTextField(this.text);

  @override
  List<Object> get props => [text];
}
