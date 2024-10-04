import '../../../../core/shared/shared.dart';
import '../../memes.dart';

class MemesModel extends MemesEntity {
  const MemesModel({
    required super.id,
    required super.name,
    required super.url,
    required super.width,
    required super.height,
    required super.boxCount,
    required super.captions,
  });

  factory MemesModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      return MemesModel(
          id: map['id'] as String,
          name: map['name'] as String,
          url: map['url'] as String,
          width: map['width'] as int,
          height: map['height'] as int,
          boxCount: map['box_count'] as int,
          captions: map['captions'] as int);
    } catch (e, stackTrace) {
      throw MemesModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
