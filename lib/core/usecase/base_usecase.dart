import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/core/error/failure.dart';
import 'package:final_project/movies/domain/entities/movie.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}

class MovieDetailsParameters extends Equatable {
  // We can here pass all of parameters we need
  final int movieId;

  const MovieDetailsParameters({required this.movieId});
  @override
  List<Object> get props => [movieId];
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object> get props => [id];
}