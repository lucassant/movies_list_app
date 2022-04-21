import 'package:dartz/dartz.dart';
import 'package:ifood_flutter_exam/core/domain/error/exceptions.dart';
import 'package:ifood_flutter_exam/core/domain/error/failures.dart';
import 'package:ifood_flutter_exam/features/movies_list/domain/entities/movie_entity.dart';
import 'package:ifood_flutter_exam/features/movies_list/infra/adapters/json_to_movie_entity.dart';
import 'package:ifood_flutter_exam/features/movies_list/infra/datasources/get_movies_datasource.dart';

import '../../domain/repositories/movies_list_repository.dart';

class MoviesListRepositoryImp implements MoviesListRepository {
  final GetMoviesDatasource getMoviesDatasource;

  MoviesListRepositoryImp({required this.getMoviesDatasource});

  @override
  Future<Either<Failure, MovieEntity>> getMovies() async {
    try {
      return getMoviesDatasource().then((data) => Right(_convert(data)));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  MovieEntity _convert(Map movie) {
    return JsonToMovieEntity.fromMap(movie);
  }
}
