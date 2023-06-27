import 'package:dartz/dartz.dart';
import 'package:final_project/core/error/failure.dart';
import 'package:final_project/core/usecase/base_usecase.dart';
import 'package:final_project/movies/domain/entities/movie.dart';
import 'package:final_project/movies/domain/entities/movie_details.dart';
import 'package:final_project/movies/domain/entities/recommendation.dart';
import 'package:final_project/movies/domain/usecase/get_recommendation.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters);
}
