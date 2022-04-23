import '../../domain/entities/movie_details_entity.dart';
import '../../domain/entities/movie_entity.dart';
import 'json_to_movie_details_entity.dart';

class JsonToMovieEntity {
  static MovieEntity fromMap(dynamic map) {
    var moviesList = <MovieDetailsEntity>[];

    if (map['results'] != null) {
      map['results'].map((e) {
        moviesList.add(JsonToMovieDetailsEntity.fromMap(e));
      }).toList();
    }

    return MovieEntity(
      id: map['id'],
      description: map['description'],
      averageRating: map['averageRating'] ?? 0.0,
      name: map['name'],
      page: map['page'],
      public: map['public'],
      moviesList: moviesList,
      revenue: map['revenue'],
    );
  }

  static Map<String, dynamic> toMap(MovieEntity movieEntity) {
    return {
      'id': movieEntity.id,
      'description': movieEntity.description,
      'averageRating': movieEntity.averageRating,
      'name': movieEntity.name,
      'page': movieEntity.page,
      'public': movieEntity.public,
      'results': movieEntity.moviesList,
      'revenue': movieEntity.revenue,
    };
  }
}
