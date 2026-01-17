import 'package:equatable/equatable.dart';

class SpeechState extends Equatable {
  final bool isListening;
  final bool isInitialized;
  final String text;
  final String? error;

  const SpeechState({
    required this.isListening,
    required this.isInitialized,
    required this.text,
    this.error,
  });

  factory SpeechState.initial() {
    return const SpeechState(
      isListening: false,
      isInitialized: false,
      text: '',
      error: null,
    );
  }

  SpeechState copyWith({
    bool? isListening,
    bool? isInitialized,
    String? text,
    String? error,
  }) {
    return SpeechState(
      isListening: isListening ?? this.isListening,
      isInitialized: isInitialized ?? this.isInitialized,
      text: text ?? this.text,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isListening, isInitialized, text, error];
}
