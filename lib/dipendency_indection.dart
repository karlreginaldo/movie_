import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app/core/api_client.dart';
import 'package:movie_app/features/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/features/presentation/cubit/movie_carousel_cubit.dart';

import 'features/domain/usecases/get_coming_soon.dart';
import 'features/domain/usecases/get_playing_now.dart';
import 'features/domain/usecases/get_populsr.dart';
import 'features/domain/usecases/get_trending.dart';

final sl = GetIt.instance;

Future init() async {
  sl.registerLazySingleton<Client>(() => Client());
  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl()));
  sl.registerLazySingleton<MovieRemoteDataSourceImpl>(
      () => MovieRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<GetTrending>(() => GetTrending(sl()));
  sl.registerLazySingleton<GetPopular>(() => GetPopular(sl()));
  sl.registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(sl()));
  sl.registerLazySingleton<GetComingSoon>(() => GetComingSoon(sl()));
  sl.registerFactory(() => MovieCarouselCubit(sl()));
}
