import 'package:memes_life/features/memes/memes.dart';

import '../../../../../core/shared/shared.dart';

part 'read_event.dart';
part 'read_state.dart';

class ReadBloc extends Bloc<ReadEvent, ReadState> {
  final ReadMemesUseCase readMemesUseCase;
  ReadBloc({
    required this.readMemesUseCase,
  }) : super(ReadInitial()) {
    on<ReadMemes>((event, emit) async {
      emit(const ReadLoading());

      final result = await readMemesUseCase();

      result.fold((failure) {
        emit(ReadError(message: failure.message));
      }, (memes) {
        emit(ReadDone(memes: memes));
      });
    });
  }
}
