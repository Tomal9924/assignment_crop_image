import '../../../../core/shared/shared.dart';
import '../../memes.dart';

class DeleteMemesUseCase {
  final MemesRepository repository;

  DeleteMemesUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required String guid,
  }) async {
    return await repository.delete(
      guid: guid,
    );
  }
}
