import 'package:ifood_flutter_exam/features/movies_list/domain/entities/movie_details_entity.dart';

class JsonToMovieDetailsEntity {
  static MovieDetailsEntity fromMap(dynamic map) {
    return MovieDetailsEntity(
      id: map['id'],
      adult: map['adult'],
      backdropPath: map['backdrop_path'],
      mediaType: map['media_type'],
      originalLanguage: map['original_language'],
      originalTitle: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity'],
      posterPath: map['poster_path'],
      releaseDate: map['release_date'],
      title: map['title'],
      video: map['video'],
      voteAverage: map['vote_average'].toDouble(),
      voteCount: map['vote_count'],
    );
  }

  static Map<String, dynamic> toMap(MovieDetailsEntity movieDetailsEntity) {
    return {
      'id': movieDetailsEntity.id,
      'adult': movieDetailsEntity.adult,
      'backdrop_path': movieDetailsEntity.backdropPath,
      'media_type': movieDetailsEntity.mediaType,
      'original_language': movieDetailsEntity.originalLanguage,
      'original_title': movieDetailsEntity.originalTitle,
      'overview': movieDetailsEntity.overview,
      'popularity': movieDetailsEntity.popularity,
      'poster_path': movieDetailsEntity.posterPath,
      'release_date': movieDetailsEntity.releaseDate,
      'title': movieDetailsEntity.title,
      'video': movieDetailsEntity.video,
      'vote_average': movieDetailsEntity.voteAverage,
      'vote_count': movieDetailsEntity.voteCount,
    };
  }
}
