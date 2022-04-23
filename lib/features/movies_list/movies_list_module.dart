import 'package:hive_flutter/adapters.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../../core/external/dio_http_service.dart';
import '../../core/external/network_info_imp.dart';
import '../../core/infra/network_info.dart';
import 'domain/repositories/movies_list_repository.dart';
import 'domain/usecases/get_movies_usecase.dart';
import 'external/datasources/movies_local_datasource_imp.dart';
import 'external/datasources/movies_remote_datasource_imp.dart';
import 'infra/datasources/movies_local_datasource.dart';
import 'infra/datasources/movies_remote_datasource.dart';
import 'infra/repositories/movies_list_repository_imp.dart';

final moviesListModule = [
  Provider<HiveInterface>.value(value: Hive),
  Provider<NetworkInfo>(
      create: (_) => NetworkInfoImp(InternetConnectionChecker())),
  Provider<MoviesRemoteDatasource>(
      create: (context) =>
          MoviesRemoteDatasourceImp(httpService: DioHttpService())),
  Provider<MoviesLocalDatasource>(
      create: (context) => MoviesLocalDatasourceImp(context.read())),
  Provider<MoviesListRepository>(
      create: (context) => MoviesListRepositoryImp(
          moviesRemoteDatasource: context.read(),
          moviesLocalDatasource: context.read(),
          networkInfo: context.read())),

  // usecases
  Provider<GetMoviesUsecase>(
      create: ((context) =>
          GetMoviesUsecase(moviesListRepository: context.read()))),
];
