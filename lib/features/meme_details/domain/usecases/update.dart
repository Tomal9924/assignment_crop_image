import '../../../../core/shared/shared.dart';
import '../../meme_details.dart';

class UpdateMemeDetailsUseCase {
  final MemeDetailsRepository repository;

  UpdateMemeDetailsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required MemeDetailsEntity memeDetails,
  }) async {
    return await repository.update(
      memeDetails: memeDetails,
    );
  }
}
