import 'movie_details_entity.dart';

class MovieEntity {
  final int id;
  final String description;
  final double averageRating;
  final String name;
  final int page;
  final bool public;
  final List<MovieDetailsEntity> moviesList;
  final int revenue;
  MovieEntity({
    required this.id,
    required this.description,
    required this.averageRating,
    required this.name,
    required this.page,
    required this.public,
    required this.moviesList,
    required this.revenue,
  });
}
