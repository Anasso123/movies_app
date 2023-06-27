import 'package:dartz/dartz.dart';
import 'package:final_project/core/error/failure.dart';
import 'package:final_project/core/usecase/base_usecase.dart';
import 'package:final_project/movies/domain/entities/movie.dart';
import 'package:final_project/movies/domain/repository/movies_repository.dart';

class GetPopularMoviesUseCase implements BaseUseCase<List<Movie>,NoParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters noParameters)async{
    return await baseMovieRepository.getPopularMovies();
  }
}