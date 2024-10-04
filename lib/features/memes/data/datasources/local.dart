import '../../../../core/shared/shared.dart';
import '../../memes.dart';

abstract class MemesLocalDataSource {
  FutureOr<void> add({
    required MemesEntity memes,
  });

  FutureOr<void> addAll({
    required List<MemesEntity> items,
  });

  FutureOr<void> update({
    required MemesEntity memes,
  });

  FutureOr<void> remove({
    required String guid,
  });

  FutureOr<void> removeAll();

  FutureOr<MemesEntity> find({
    required String guid,
  });
}
