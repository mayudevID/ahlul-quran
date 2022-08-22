import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/quran/data/datasources/quran_data_remote_data_source.dart';
import 'features/quran/data/repositories/quran_data_repository_impl.dart';
import 'features/quran/domain/repositories/quran_data_repository.dart';
import 'features/quran/domain/usecases/get_quran_data.dart';
import 'features/quran/presentation/bloc/quran_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! BLOC
  sl.registerFactory(() => QuranBloc(getQuranData: sl()));

  //! USE CASES
  sl.registerLazySingleton(() => GetQuranData(quranDataRepository: sl()));

  //! REPOSITORIES
  sl.registerLazySingleton<QuranDataRepository>(
    () => QuranDataRepositoryImpl(quranDataRemoteDataSource: sl()),
  );

  //! DATA SOURCES
  sl.registerLazySingleton<QuranDataRemoteDataSource>(
    () => QuranDataRemoteDataSourceImpl(dio: sl()),
  );

  //! CORE

  //! EXTERNAL
  sl.registerLazySingleton(() => Dio());
}
