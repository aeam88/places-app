import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:places_app/features/places/presentation/cubit/mic/mic_cubit.dart';
import 'package:places_app/features/places/presentation/cubit/speech/speech_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Notas', style: TextStyle(fontWeight: FontWeight.w600),),
        actions: [
          IconButton(onPressed: () => context.go('/settings'), icon: Icon(Icons.settings_outlined))
        ],
      ),
      body: ListView.builder(
          itemCount: 22,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
               context.go('/details');
              },
              title: const Text('Peluquería canina', style: TextStyle(fontWeight: FontWeight.w600),),
              subtitle: const Text('18/01/2026'),
              trailing: Wrap(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.edit_outlined)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete_outlined)),
                ],
              ),
            );
          }
        ),
      floatingActionButton: BlocBuilder<MicCubit, bool>(
        builder: (context, isPressed) {
          return GestureDetector(
            onLongPress: () {
              context.read<MicCubit>().startRecording();
              context.read<SpeechCubit>().startListening();
            },
            onLongPressEnd: (_) {
              context.read<MicCubit>().stopRecording();
              context.read<SpeechCubit>().stopListening();
            },
            child: FloatingActionButton(
              backgroundColor: isPressed ? Colors.red : Colors.black,
              onPressed: () {}, // obligatorio
              child: Icon(
                isPressed ? Icons.pause : Icons.mic_none,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}