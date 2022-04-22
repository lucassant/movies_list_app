import '../../../../core/infra/http_service.dart';
import '../../infra/datasources/get_movies_datasource.dart';

class GetMoviesRemoteDatasourceImp implements GetMoviesDatasource {
  final HttpService httpService;

  GetMoviesRemoteDatasourceImp({required this.httpService});

  @override
  Future<Map> call() async {
    return await httpService
        .get('/list/1?page=1')
        .then((response) => response.data);
  }
}
