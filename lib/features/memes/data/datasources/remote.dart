import '../../../../core/shared/shared.dart';
import '../../memes.dart';

abstract class MemesRemoteDataSource {
  FutureOr<void> create({
    required MemesEntity memes,
  });

  FutureOr<void> delete({
    required String guid,
  });

  FutureOr<MemesModel> find({
    required String guid,
  });

  FutureOr<List<MemesModel>> read();

  FutureOr<List<MemesModel>> refresh();

  FutureOr<List<MemesModel>> search({
    required String query,
  });

  FutureOr<void> update({
    required MemesEntity memes,
  });
}
