import 'package:dartz/dartz.dart';

import '../../../../core/domain/error/failures.dart';
import '../entities/movie_entity.dart';

abstract class MoviesListRepository {
  Future<Either<Failure, MovieEntity>> getMovies();
}
