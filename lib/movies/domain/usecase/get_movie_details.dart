import 'package:dartz/dartz.dart';
import 'package:final_project/core/error/failure.dart';
import 'package:final_project/core/usecase/base_usecase.dart';
import 'package:final_project/movies/domain/entities/movie_details.dart';
import 'package:final_project/movies/domain/repository/movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails,MovieDetailsParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameters) async{
    return await baseMovieRepository.getMovieDetails(parameters);
  }

}