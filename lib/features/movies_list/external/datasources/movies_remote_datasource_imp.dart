import '../../../../core/infra/http_service.dart';
import '../../infra/datasources/movies_remote_datasource.dart';

class MoviesRemoteDatasourceImp implements MoviesRemoteDatasource {
  final HttpService httpService;

  MoviesRemoteDatasourceImp({required this.httpService});

  @override
  Future<Map> getMovies() async {
    return await httpService
        .get('/list/1?page=1')
        .then((response) => response.data);
  }
}
