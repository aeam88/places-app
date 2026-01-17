import 'package:flutter_bloc/flutter_bloc.dart';

class MicCubit extends Cubit<bool> {
  MicCubit() : super(false);

  void startRecording() => emit(true);
  void stopRecording() => emit(false);
}
