import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/core/error/failure.dart';
import 'package:final_project/core/usecase/base_usecase.dart';
import 'package:final_project/movies/domain/entities/recommendation.dart';
import 'package:final_project/movies/domain/repository/movies_repository.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters) async{
    return await baseMovieRepository.getRecommendation(parameters);
  }
}


