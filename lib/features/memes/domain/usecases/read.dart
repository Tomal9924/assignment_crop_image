import '../../../../core/shared/shared.dart';
import '../../memes.dart';

class ReadMemesUseCase {
  final MemesRepository repository;

  ReadMemesUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<MemesEntity>>> call() async {
    return await repository.read();
  }
}
