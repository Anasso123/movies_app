import 'package:final_project/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({required super.backDropPath, required super.id});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(backDropPath: json['backdrop_path'] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg', id: json['id']);
}
