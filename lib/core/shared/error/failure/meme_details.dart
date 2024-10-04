part of 'failure.dart';

class MemeDetailsModelParseFailure extends Failure {
  MemeDetailsModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class MemeDetailsNotFoundInLocalCacheFailure extends Failure {
  MemeDetailsNotFoundInLocalCacheFailure()
      : super(
          message: 'MemeDetails not found in local cache.',
        );
}
