import '../../../../core/shared/shared.dart';
import '../../meme_details.dart';

class MemeDetailsRepositoryImpl extends MemeDetailsRepository {
  final NetworkInfo network;
  final MemeDetailsRemoteDataSource remote;

  MemeDetailsRepositoryImpl({
    required this.network,
    required this.remote,
  });

  @override
  FutureOr<Either<Failure, void>> create({
    required MemeDetailsEntity memeDetails,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.create(memeDetails: memeDetails);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, void>> delete({
    required String guid,
  }) async {
    try {
      if (await network.online) {
        await remote.delete(
          guid: guid,
        );

        return const Right(null);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, MemeDetailsEntity>> find({
    required String guid,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.find(
          guid: guid,
        );

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on MemeDetailsNotFoundInLocalCacheFailure catch (_) {
      return Left(_);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<MemeDetailsEntity>>> read() async {
    try {
      if (await network.online) {
        final result = await remote.read();

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<MemeDetailsEntity>>> refresh() async {
    try {
      if (await network.online) {
        final result = await remote.refresh();

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<MemeDetailsEntity>>> search({
    required String query,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.search(
          query: query,
        );

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, void>> update({
    required MemeDetailsEntity memeDetails,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.update(memeDetails: memeDetails);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
