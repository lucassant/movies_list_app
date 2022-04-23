import 'package:flutter_test/flutter_test.dart';
import 'package:movies_list_app/core/external/dio_http_service.dart';
import 'package:movies_list_app/core/infra/http_service.dart';
import 'package:movies_list_app/features/movies_list/external/datasources/movies_remote_datasource_imp.dart';
import 'package:movies_list_app/features/movies_list/infra/datasources/movies_remote_datasource.dart';

main() {
  late final HttpService dio;
  late final MoviesRemoteDatasource dataSource;

  setUp(() {
    dio = DioHttpService();
    dataSource = MoviesRemoteDatasourceImp(httpService: dio);
  });

  group('getMoviesDatasource:', () {
    test('should return a valid Map', () async {
      Map map = await dataSource.getMovies();

      expect(map, isNotNull);
    });
  });
}
