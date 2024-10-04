import '../../../../core/shared/shared.dart';
import '../../memes.dart';

typedef MemesEntityPaginatedResponse = ({
  List<MemesEntity> items,
  int total,
});

abstract class MemesRepository {
  FutureOr<Either<Failure, void>> create({
    required MemesEntity memes,
  });

  FutureOr<Either<Failure, void>> delete({
    required String guid,
  });

  FutureOr<Either<Failure, MemesEntity>> find({
    required String guid,
  });

  FutureOr<Either<Failure, List<MemesEntity>>> read();

  FutureOr<Either<Failure, List<MemesEntity>>> refresh();

  FutureOr<Either<Failure, List<MemesEntity>>> search({
    required String query,
  });

  FutureOr<Either<Failure, void>> update({
    required MemesEntity memes,
  });
}
