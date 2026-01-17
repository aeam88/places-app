import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'speech_state.dart';

class SpeechCubit extends Cubit<SpeechState> {
  final SpeechToText _speechToText = SpeechToText();

  SpeechCubit() : super(SpeechState.initial());

  Future<void> init() async {
    final available = await _speechToText.initialize(
      onError: (error) {
        emit(state.copyWith(error: error.errorMsg));
      },
    );

    if (!available) {
      emit(state.copyWith(error: 'Speech recognition not available'));
    }
  }

  Future<void> startListening() async {
  if (!state.isInitialized) {
    emit(state.copyWith(error: 'Speech no inicializado'));
    return;
  }

  if (state.isListening) return;

  emit(state.copyWith(isListening: true));

  await _speechToText.listen(
    localeId: 'es_ES',
    onResult: (result) {
      // print('🎤 Texto reconocido: ${result.recognizedWords}');
      // print('🕒 Es final: ${result.finalResult}');
      emit(state.copyWith(
        text: result.recognizedWords,
      ));
    },
  );
}

  Future<void> stopListening() async {
    await _speechToText.stop();
    emit(state.copyWith(isListening: false));
  }
}
