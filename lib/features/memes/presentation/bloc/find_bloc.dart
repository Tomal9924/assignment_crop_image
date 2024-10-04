import '../../../../core/shared/shared.dart';
import '../../memes.dart';

part 'find_event.dart';
part 'find_state.dart';

class FindMemesBloc extends Bloc<FindMemesEvent, FindMemesState> {
  final FindMemesUseCase useCase;
  FindMemesBloc({required this.useCase}) : super(const FindMemesInitial()) {
    on<FindMemes>((event, emit) async {
      emit(const FindMemesLoading());
      final result = await useCase(guid: event.guid);
      result.fold(
        (failure) => emit(FindMemesError(failure: failure)),
        (memes) => emit(FindMemesDone(memes: memes)),
      );
    });
  }
}
