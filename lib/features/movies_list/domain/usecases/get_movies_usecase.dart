import 'package:dartz/dartz.dart';

import '../../../../core/domain/error/failures.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../entities/movie_entity.dart';
import '../repositories/movies_list_repository.dart';

class GetMoviesUsecase implements UseCase<MovieEntity, NoParams> {
  final MoviesListRepository moviesListRepository;

  GetMoviesUsecase({required this.moviesListRepository});

  @override
  Future<Either<Failure, MovieEntity>> call(NoParams params) async {
    final result = await moviesListRepository.getMovies();

    if (result.isRight()) {
      return Right(result.toIterable().single);
    } else {
      return Left(ServerFailure());
    }
  }
}
