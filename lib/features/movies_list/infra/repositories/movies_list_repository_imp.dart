import 'package:dartz/dartz.dart';

import '../../../../core/domain/error/exceptions.dart';
import '../../../../core/domain/error/failures.dart';
import '../../../../core/infra/network_info.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/movies_list_repository.dart';
import '../adapters/json_to_movie_entity.dart';
import '../datasources/movies_local_datasource.dart';
import '../datasources/movies_remote_datasource.dart';

class MoviesListRepositoryImp implements MoviesListRepository {
  final MoviesRemoteDatasource moviesRemoteDatasource;
  final MoviesLocalDatasource moviesLocalDatasource;
  final NetworkInfo networkInfo;

  MoviesListRepositoryImp({
    required this.moviesRemoteDatasource,
    required this.moviesLocalDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, MovieEntity>> getMovies() async {
    try {
      if (await networkInfo.isConnected) {
        return Right(await _getMoviesFromRemote());
      }

      return Right(await _getMoviesFromLocal());
    } on ServerException {
      return Left(ServerFailure());
    } on LocalCacheException {
      return Left(LocalCacheFailure());
    }
  }

  Future<MovieEntity> _getMoviesFromLocal() async {
    final Map jsonMovieEntity = await moviesLocalDatasource.getMovies();
    return _convert(jsonMovieEntity);
  }

  Future<MovieEntity> _getMoviesFromRemote() async {
    final Map jsonMovieEntity = await moviesRemoteDatasource.getMovies();
    await moviesLocalDatasource.saveMovies(jsonMovieEntity);
    return _convert(jsonMovieEntity);
  }

  MovieEntity _convert(Map movie) {
    return JsonToMovieEntity.fromMap(movie);
  }
}
