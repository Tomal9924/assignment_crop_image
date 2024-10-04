part of 'read_bloc.dart';

sealed class ReadState extends Equatable {
  const ReadState();

  @override
  List<Object> get props => [];
}

final class ReadInitial extends ReadState {}

final class ReadLoading extends ReadState {
  const ReadLoading();

  @override
  List<Object> get props => [];
}

final class ReadDone extends ReadState {
  final List<MemesEntity> memes;
  const ReadDone({required this.memes});

  @override
  List<Object> get props => [memes];
}

final class ReadError extends ReadState {
  final String message;
  const ReadError({required this.message});

  @override
  List<Object> get props => [message];
}
