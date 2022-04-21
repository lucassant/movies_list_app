import 'package:ifood_flutter_exam/core/domain/services/http_service.dart';

import '../../infra/datasources/get_movies_datasource.dart';

class GetMoviesDatasourceImp implements GetMoviesDatasource {
  final HttpService httpService;

  GetMoviesDatasourceImp({required this.httpService});

  @override
  Future<Map> call() async {
    return await httpService
        .get('list/2?page=1')
        .then((response) => response.data);
  }
}
