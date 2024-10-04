import '../../../../core/shared/shared.dart';
import '../../meme_details.dart';

typedef MemeDetailsEntityPaginatedResponse = ({
  List<MemeDetailsEntity> items,
  int total,
});

abstract class MemeDetailsRepository {
  FutureOr<Either<Failure, void>> create({
    required MemeDetailsEntity memeDetails,
  });

  FutureOr<Either<Failure, void>> delete({
    required String guid,
  });

  FutureOr<Either<Failure, MemeDetailsEntity>> find({
    required String guid,
  });

  FutureOr<Either<Failure, List<MemeDetailsEntity>>> read();

  FutureOr<Either<Failure, List<MemeDetailsEntity>>> refresh();

  FutureOr<Either<Failure, List<MemeDetailsEntity>>> search({
    required String query,
  });

  FutureOr<Either<Failure, void>> update({
    required MemeDetailsEntity memeDetails,
  });
}
