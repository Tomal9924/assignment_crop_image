import '../../../../core/shared/shared.dart';
import '../../memes.dart';

class RefreshMemesUseCase {
  final MemesRepository repository;

  RefreshMemesUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<MemesEntity>>> call() async {
    return await repository.refresh();
  }
}
