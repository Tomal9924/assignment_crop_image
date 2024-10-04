import '../../../../core/shared/shared.dart';
import '../../memes.dart';

class CreateMemesUseCase {
  final MemesRepository repository;

  CreateMemesUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required MemesEntity memes,
  }) async {
    return await repository.create(
      memes: memes,
    );
  }
}
