part of '../config.dart';

Future<void> get memeDetailsDependencies async {
  //! ----------------- Bloc -----------------

  //! ----------------- UseCase -----------------

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<MemeDetailsRepository>(
    () => MemeDetailsRepositoryImpl(
      network: sl(),
      remote: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<MemeDetailsRemoteDataSource>(
    () => MemeDetailsRemoteDataSourceImpl(
      client: sl(),
    ),
  );
}
