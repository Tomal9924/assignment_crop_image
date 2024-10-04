import '../../../../core/shared/shared.dart';
import '../../meme_details.dart';

abstract class MemeDetailsRemoteDataSource {
  FutureOr<void> create({
    required MemeDetailsEntity memeDetails,
  });

  FutureOr<void> delete({
    required String guid,
  });

  FutureOr<MemeDetailsModel> find({
    required String guid,
  });

  FutureOr<List<MemeDetailsModel>> read();

  FutureOr<List<MemeDetailsModel>> refresh();

  FutureOr<List<MemeDetailsModel>> search({
    required String query,
  });

  FutureOr<void> update({
    required MemeDetailsEntity memeDetails,
  });
}
