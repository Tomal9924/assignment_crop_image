import '../../../../core/shared/shared.dart';
import '../../meme_details.dart';

class DeleteMemeDetailsUseCase {
  final MemeDetailsRepository repository;

  DeleteMemeDetailsUseCase({
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
