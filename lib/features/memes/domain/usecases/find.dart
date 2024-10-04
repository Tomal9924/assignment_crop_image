import '../../../../core/shared/shared.dart';
import '../../memes.dart';

class FindMemesUseCase {
  final MemesRepository repository;

  FindMemesUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, MemesEntity>> call({
    required String guid,
  }) async {
    return await repository.find(
      guid: guid,
    );
  }
}
