import '../../../../core/shared/shared.dart';
import '../../meme_details.dart';

class MemeDetailsModel extends MemeDetailsEntity {
  // TODO: implement model properties
  MemeDetailsModel({
    required super.guid,
  });

  factory MemeDetailsModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      // TODO: implement parse
      throw UnimplementedError();
    } catch (e, stackTrace) {
      throw MemeDetailsModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
