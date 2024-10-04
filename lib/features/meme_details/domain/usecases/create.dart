import '../../../../core/shared/shared.dart';
import '../../meme_details.dart';

class CreateMemeDetailsUseCase {
  final MemeDetailsRepository repository;

  CreateMemeDetailsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required MemeDetailsEntity memeDetails,
  }) async {
    return await repository.create(
      memeDetails: memeDetails,
    );
  }
}
