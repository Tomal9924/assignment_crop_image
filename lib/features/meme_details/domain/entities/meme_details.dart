import '../../../../core/shared/shared.dart';

class MemeDetailsEntity extends Equatable {
  // TODO: implement entity properties
  final String guid;

  MemeDetailsEntity({
    required this.guid,
  });

  factory MemeDetailsEntity.create() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        // TODO: add entity properties
        guid,
      ];
}
