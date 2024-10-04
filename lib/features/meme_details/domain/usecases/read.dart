import '../../../../core/shared/shared.dart';
import '../../meme_details.dart';

class ReadMemeDetailsUseCase {
  final MemeDetailsRepository repository;

  ReadMemeDetailsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<MemeDetailsEntity>>> call() async {
    return await repository.read();
  }
}
