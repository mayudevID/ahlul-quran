import 'package:alquran_mobile_apps/features/list_verse/domain/usecases/save_marker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/list_verse/data/datasources/verse_data_local_data_source.dart';
import 'features/list_verse/data/datasources/verse_data_remote_data_source.dart';
import 'features/list_verse/data/repositories/verse_data_repository_impl.dart';
import 'features/list_verse/domain/repositories/verse_data_repository.dart';
import 'features/list_verse/domain/usecases/get_verse_data.dart';
import 'features/list_verse/presentation/bloc/list_verse_bloc.dart';
import 'features/quran/data/datasources/quran_data_remote_data_source.dart';
import 'features/quran/data/repositories/quran_data_repository_impl.dart';
import 'features/quran/domain/repositories/quran_data_repository.dart';
import 'features/quran/domain/usecases/get_quran_data.dart';
import 'features/quran/presentation/bloc/quran_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! BLOC
  sl.registerFactory(() => QuranBloc(getQuranData: sl()));
  sl.registerFactory(() => ListVerseBloc(getVerseData: sl(), saveMarker: sl()));

  //! USE CASES
  sl.registerLazySingleton(() => GetQuranData(quranDataRepository: sl()));
  sl.registerLazySingleton(() => GetVerseData(verseDataRepository: sl()));
  sl.registerLazySingleton(() => SaveMarker(verseDataRepository: sl()));

  //! REPOSITORIES
  sl.registerLazySingleton<QuranDataRepository>(
    () => QuranDataRepositoryImpl(quranDataRemoteDataSource: sl()),
  );
  sl.registerLazySingleton<VerseDataRepository>(
    () => VerseDataRepositoryImpl(
      verseDataRemoteDataSource: sl(),
      verseDataLocalDataSource: sl(),
    ),
  );

  //! DATA SOURCES
  sl.registerLazySingleton<QuranDataRemoteDataSource>(
    () => QuranDataRemoteDataSourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<VerseDataRemoteDataSource>(
    () => VerseDataRemoteDataSourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<VerseDataLocalDataSource>(
    () => VerseDataLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! CORE

  //! EXTERNAL
  sl.registerLazySingleton(() => Dio());
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPref);
}
