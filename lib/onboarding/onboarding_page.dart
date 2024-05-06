import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voice_chat/UI/colors/my_colors.dart';
import 'package:voice_chat/UI/mediaquery/mediaquery.dart';
import 'package:voice_chat/onboarding/bloc/onboarding_bloc.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final TextEditingController controllerUsername;
  late final OnboardingBloc onboardingBloc;

  @override
  void initState() {
    super.initState();
    controllerUsername = TextEditingController();
    onboardingBloc = OnboardingBloc(controllerUsername: controllerUsername);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().lightGray,
      body: BlocProvider(
        create: (context) => onboardingBloc,
        child: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            if (state is OnboardingInitial) {
              return const CircularProgressIndicator(color: Colors.amber);
            }

            if (state is OnboardingLoaded) {
              return Padding(
                padding: const EdgeInsets.all(64.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${MediaQueryValues(context).width}'),
                    Text(
                      'Boas vindas!',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Este projeto está em desenvolvimento, e é utilizado somente para fins de estudos',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      'Tem como intuito estudo do BLoC, Responsividade dos widgets em diferentes telas, entre outros métodos.',
                      style: GoogleFonts.roboto(
                        textStyle:
                            TextStyle(fontSize: 16, color: MyColors().purple),
                      ),
                    ),
                    const SizedBox(height: 42),
                    Text(
                      'Defina um nome para uma melhor experiência.',
                      style: GoogleFonts.roboto(
                        textStyle:
                            TextStyle(fontSize: 18, color: MyColors().darkGray),
                      ),
                    ),
                    const SizedBox(height: 2),
                    FractionallySizedBox(
                      widthFactor: MediaQueryValues(context).widthMaximized,
                      child: TextFormField(
                        controller: controllerUsername,
                        style: GoogleFonts.roboto(
                          textStyle:
                              TextStyle(fontSize: 16, color: MyColors().purple),
                        ).copyWith(fontSize: 16),
                        maxLength: 12,
                        decoration: const InputDecoration(
                          hintText: 'Digite um username',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                          labelText: 'Username',
                        ),
                        onChanged: (value) {
                          if (value.isEmpty) {
                            onboardingBloc.add(
                                OnboardingTextField(controllerUsername.text));
                          } else {
                            onboardingBloc.add(OnboardingTextField(value));
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 22),
                    FractionallySizedBox(
                      widthFactor: MediaQueryValues(context).widthMaximized,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors().purple,
                          foregroundColor: MyColors().white,
                        ),
                        onPressed: state.buttonEnabled == false
                            ? () {
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              }
                            : null,
                        child: const Center(
                          child: Text('Vamos lá'),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const CircularProgressIndicator(color: Colors.red);
          },
        ),
      ),
    );
  }
}
