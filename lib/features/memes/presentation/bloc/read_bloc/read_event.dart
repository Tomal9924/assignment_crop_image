part of 'read_bloc.dart';

sealed class ReadEvent extends Equatable {
  const ReadEvent();

  @override
  List<Object> get props => [];
}

class ReadMemes extends ReadEvent {
  const ReadMemes();

  @override
  List<Object> get props => [];
}
