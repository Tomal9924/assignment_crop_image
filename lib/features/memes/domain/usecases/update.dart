import '../../../../core/shared/shared.dart';
import '../../memes.dart';

class UpdateMemesUseCase {
  final MemesRepository repository;

  UpdateMemesUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required MemesEntity memes,
  }) async {
    return await repository.update(
      memes: memes,
    );
  }
}
