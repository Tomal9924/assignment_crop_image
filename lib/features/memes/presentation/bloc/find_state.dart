part of 'find_bloc.dart';

abstract class FindMemesState extends Equatable {
  const FindMemesState();

  @override
  List<Object> get props => [];
}

class FindMemesInitial extends FindMemesState {
  const FindMemesInitial();
}

class FindMemesLoading extends FindMemesState {
  const FindMemesLoading();
}

class FindMemesError extends FindMemesState {
  final Failure failure;

  const FindMemesError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

class FindMemesDone extends FindMemesState {
  final MemesEntity memes;

  const FindMemesDone({required this.memes});

  @override
  List<Object> get props => [memes];
}
