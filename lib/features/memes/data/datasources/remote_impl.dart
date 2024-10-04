import '../../../../core/shared/constants.dart';
import '../../../../core/shared/shared.dart';
import '../../memes.dart';

class MemesRemoteDataSourceImpl extends MemesRemoteDataSource {
  final Client client;

  MemesRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> create({
    required MemesEntity memes,
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
  FutureOr<MemesModel> find({
    required String guid,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<MemesModel>> read() async {
    try {
      final Response response = await client.get(
        ApiConstants.url(api: ApiConstants.fetch),
      );

      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> result =
            Map<String, dynamic>.from(json.decode(response.body));
        if (result["success"] as bool) {
          final List<MemesModel> resultList =
              List<Map<String, dynamic>>.from(result["data"]['memes'])
                  .map(
                    (e) => MemesModel.parse(map: e),
                  )
                  .toList();
          return resultList;
        } else {
          final String errorMessage = result["message"] ?? "";
          throw RemoteFailure(message: errorMessage);
        }
      } else {
        throw RemoteFailure(
            message: response.reasonPhrase ?? "Api call failed");
      }
    } catch (e) {
      throw RemoteFailure(message: "Api call failed ------ $e");
    }
  }

  @override
  FutureOr<List<MemesModel>> refresh() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<MemesModel>> search({
    required String query,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> update({
    required MemesEntity memes,
  }) async {
    throw UnimplementedError();
  }
}
