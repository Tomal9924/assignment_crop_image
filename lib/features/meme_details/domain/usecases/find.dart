import '../../../../core/shared/shared.dart';
import '../../meme_details.dart';

class FindMemeDetailsUseCase {
  final MemeDetailsRepository repository;

  FindMemeDetailsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, MemeDetailsEntity>> call({
    required String guid,
  }) async {
    return await repository.find(
      guid: guid,
    );
  }
}
