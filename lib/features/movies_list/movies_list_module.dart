import 'package:ifood_flutter_exam/core/external/dio_http_service.dart';
import 'package:ifood_flutter_exam/features/movies_list/domain/repositories/movies_list_repository.dart';
import 'package:ifood_flutter_exam/features/movies_list/domain/usecases/get_movies_usecase.dart';
import 'package:ifood_flutter_exam/features/movies_list/external/datasources/get_movies_remote_datasource_imp.dart';
import 'package:ifood_flutter_exam/features/movies_list/infra/datasources/get_movies_datasource.dart';
import 'package:ifood_flutter_exam/features/movies_list/infra/repositories/movies_list_repository_imp.dart';
import 'package:provider/provider.dart';

final moviesListModule = [
  Provider<GetMoviesDatasource>(
      create: (context) =>
          GetMoviesRemoteDatasourceImp(httpService: DioHttpService())),
  Provider<MoviesListRepository>(
      create: (context) =>
          MoviesListRepositoryImp(getMoviesDatasource: context.read())),

  // usecases
  Provider<GetMoviesUsecase>(
      create: ((context) =>
          GetMoviesUsecase(moviesListRepository: context.read()))),
];
