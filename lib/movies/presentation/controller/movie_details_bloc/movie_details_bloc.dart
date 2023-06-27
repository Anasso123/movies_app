import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/core/usecase/base_usecase.dart';
import 'package:final_project/core/utils/enums.dart';
import 'package:final_project/movies/domain/entities/movie_details.dart';
import 'package:final_project/movies/domain/entities/recommendation.dart';
import 'package:final_project/movies/domain/usecase/get_movie_details.dart';
import 'package:final_project/movies/domain/usecase/get_recommendation.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.getRecommendationUseCase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              movieDetailsState: RequestState.error,
              movieDetailsMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              movieDetails: r,
              movieDetailsState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result =
    await getRecommendationUseCase(RecommendationParameters(event.id));
    result.fold(
            (l) => emit(state.copyWith(
          recommendationState: RequestState.error,
          recommendationMessage: l.message,
        )),
            (r) => emit(state.copyWith(
          recommendation: r,
          recommendationState: RequestState.loaded,
        )));
  }
}
