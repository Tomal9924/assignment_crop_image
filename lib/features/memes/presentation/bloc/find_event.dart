part of 'find_bloc.dart';

abstract class FindMemesEvent extends Equatable {
  const FindMemesEvent();

  @override
  List<Object> get props => [];
}

class FindMemes extends FindMemesEvent {
  final String guid;

  const FindMemes({
    required this.guid,
  });
  @override
  List<Object> get props => [guid];
}
