import '../../../../core/shared/shared.dart';

class MemesEntity extends Equatable {
  final String id;
  final String name;
  final String url;
  final int width;
  final int height;
  final int boxCount;
  final int captions;

  const MemesEntity({
    required this.id,
    required this.name,
    required this.url,
    required this.width,
    required this.height,
    required this.boxCount,
    required this.captions,
  });

  factory MemesEntity.create() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        id,
        name,
        url,
        width,
        height,
        boxCount,
        captions,
      ];
}
