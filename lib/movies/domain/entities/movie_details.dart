import 'package:equatable/equatable.dart';
import 'package:final_project/movies/domain/entities/genres.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final List<Genres> genres;
  final int id;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;

  const MovieDetails({
    required this.backdropPath,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
    required this.genres,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        overview,
        releaseDate,
        runtime,
        title,
        voteAverage,
      ];
}
