import '../../../../core/shared/shared.dart';
import '../../meme_details.dart';

class MemeDetailsRemoteDataSourceImpl extends MemeDetailsRemoteDataSource {
  final Client client;

  MemeDetailsRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> create({
    required MemeDetailsEntity memeDetails,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> delete({
    required String guid,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<MemeDetailsModel> find({
    required String guid,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<MemeDetailsModel>> read() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<MemeDetailsModel>> refresh() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<MemeDetailsModel>> search({
    required String query,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> update({
    required MemeDetailsEntity memeDetails,
  }) async {
    throw UnimplementedError();
  }
}
