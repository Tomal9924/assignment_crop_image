import '../../../../core/shared/shared.dart';
import '../../meme_details.dart';

class SearchMemeDetailsUseCase {
  final MemeDetailsRepository repository;

  SearchMemeDetailsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<MemeDetailsEntity>>> call({
    required String query,
  }) async {
    return await repository.search(
      query: query,
    );
  }
}
