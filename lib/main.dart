import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places_app/core/routes/app_router.dart';
import 'package:places_app/features/places/presentation/cubit/mic/mic_cubit.dart';
import 'package:places_app/features/places/presentation/cubit/speech/speech_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MicCubit>(create: (context) => MicCubit(),),
        BlocProvider(create: (context) => SpeechCubit()..init())
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        title: 'Places',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
      ),
    );
  }
}