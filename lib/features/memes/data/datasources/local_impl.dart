import '../../../../core/shared/shared.dart';
import '../../memes.dart';

class MemesLocalDataSourceImpl extends MemesLocalDataSource {
  final Map<String, MemesEntity> _cache = {};

  @override
  FutureOr<void> add({
    required MemesEntity memes,
  }) {
    _cache[memes.id] = memes;
  }

  @override
  FutureOr<void> addAll({
    required List<MemesEntity> items,
  }) {
    for (final item in items) {
      _cache[item.id] = item;
    }
  }

  @override
  FutureOr<void> update({
    required MemesEntity memes,
  }) {
    _cache[memes.id] = memes;
  }

  @override
  FutureOr<void> remove({
    required String guid,
  }) {
    _cache.remove(guid);
  }

  @override
  FutureOr<void> removeAll() {
    _cache.clear();
  }

  @override
  FutureOr<MemesEntity> find({
    required String guid,
  }) {
    final item = _cache[guid];
    if (item == null) {
      throw MemesNotFoundInLocalCacheFailure();
    }
    return item;
  }
}
