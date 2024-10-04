import '../../../../core/shared/shared.dart';
import '../../meme_details.dart';

class RefreshMemeDetailsUseCase {
  final MemeDetailsRepository repository;

  RefreshMemeDetailsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<MemeDetailsEntity>>> call() async {
    return await repository.refresh();
  }
}
