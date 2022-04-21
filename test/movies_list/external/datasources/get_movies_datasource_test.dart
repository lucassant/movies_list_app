import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_flutter_exam/core/data/services/dio_http_service.dart';
import 'package:ifood_flutter_exam/core/domain/services/http_service.dart';
import 'package:ifood_flutter_exam/features/movies_list/external/datasources/get_movies_datasource_imp.dart';
import 'package:ifood_flutter_exam/features/movies_list/infra/datasources/get_movies_datasource.dart';

main() {
  late final HttpService dio;
  late final GetMoviesDatasource dataSource;

  setUp(() {
    dio = DioHttpService();
    dataSource = GetMoviesDatasourceImp(httpService: dio);
  });

  group('getMoviesDatasource:', () {
    test('should return a valid Map', () async {
      Map map = await dataSource();

      expect(map, isNotNull);
    });
  });
}
