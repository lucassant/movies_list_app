import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_flutter_exam/core/external/dio_http_service.dart';
import 'package:ifood_flutter_exam/core/infra/http_service.dart';
import 'package:ifood_flutter_exam/features/movies_list/external/datasources/get_movies_remote_datasource_imp.dart';
import 'package:ifood_flutter_exam/features/movies_list/infra/datasources/get_movies_datasource.dart';

main() {
  late final HttpService dio;
  late final GetMoviesDatasource dataSource;

  setUp(() {
    dio = DioHttpService();
    dataSource = GetMoviesRemoteDatasourceImp(httpService: dio);
  });

  group('getMoviesDatasource:', () {
    test('should return a valid Map', () async {
      Map map = await dataSource();

      expect(map, isNotNull);
    });
  });
}
