import '../../../../core/shared/shared.dart';
import '../../memes.dart';

class SearchMemesUseCase {
  final MemesRepository repository;

  SearchMemesUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<MemesEntity>>> call({
    required String query,
  }) async {
    return await repository.search(
      query: query,
    );
  }
}
