part of '../config.dart';

Future<void> get memesDependencies async {
  //! ----------------- Bloc -----------------
  sl.registerFactory(
    () => FindMemesBloc(
      useCase: sl(),
    ),
  );
  sl.registerFactory(
    () => ReadBloc(
      readMemesUseCase: sl(),
    ),
  );

  //! ----------------- UseCase -----------------
  sl.registerFactory(
    () => FindMemesUseCase(
      repository: sl(),
    ),
  );
  sl.registerFactory(
    () => ReadMemesUseCase(
      repository: sl(),
    ),
  );

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<MemesRepository>(
    () => MemesRepositoryImpl(
      network: sl(),
      remote: sl(),
      local: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<MemesRemoteDataSource>(
    () => MemesRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<MemesLocalDataSource>(
    () => MemesLocalDataSourceImpl(),
  );
}
