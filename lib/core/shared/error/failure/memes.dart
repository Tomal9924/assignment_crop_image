part of 'failure.dart';

class MemesModelParseFailure extends Failure {
  MemesModelParseFailure({
    required super.message,
    required super.stackTrace,
  });
}

class MemesNotFoundInLocalCacheFailure extends Failure {
  MemesNotFoundInLocalCacheFailure()
      : super(
          message: 'Memes not found in local cache.',
        );
}
