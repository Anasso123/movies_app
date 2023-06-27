import 'package:final_project/movies/data/datasource/movie_remote_datasource.dart';
import 'package:final_project/movies/data/repository/movies_repository.dart';
import 'package:final_project/movies/domain/repository/movies_repository.dart';
import 'package:final_project/movies/domain/usecase/get_movie_details.dart';
import 'package:final_project/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:final_project/movies/domain/usecase/get_popular_movies.dart';
import 'package:final_project/movies/domain/usecase/get_recommendation.dart';
import 'package:final_project/movies/domain/usecase/get_top_rated_movies.dart';
import 'package:final_project/movies/presentation/controller/get_data_bloc/movies_bloc.dart';
import 'package:final_project/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMovieRepository>(
        () => MoviesRepository(baseMovieRemoteDatasource: sl()));

    /// Datasource
    sl.registerLazySingleton<BaseMovieRemoteDatasource>(
        () => MovieRemoteDatasource());
  }
}
