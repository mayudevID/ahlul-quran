import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';

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
  sl.registerFactory(() => QuranBloc(getQuranData: sl(), audioPlayer: sl()));
  sl.registerFactory(() => ListVerseBloc(getVerseData: sl()));

  //! USE CASES
  sl.registerLazySingleton(() => GetQuranData(quranDataRepository: sl()));
  sl.registerLazySingleton(() => GetVerseData(verseDataRepository: sl()));

  //! REPOSITORIES
  sl.registerLazySingleton<QuranDataRepository>(
    () => QuranDataRepositoryImpl(quranDataRemoteDataSource: sl()),
  );
  sl.registerLazySingleton<VerseDataRepository>(
    () => VerseDataRepositoryImpl(verseDataRemoteDataSource: sl()),
  );

  //! DATA SOURCES
  sl.registerLazySingleton<QuranDataRemoteDataSource>(
    () => QuranDataRemoteDataSourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<VerseDataRemoteDataSource>(
    () => VerseDataRemoteDataSourceImpl(dio: sl()),
  );

  //! CORE

  //! EXTERNAL
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => AudioPlayer());
}
