import 'package:dio/dio.dart';
import 'package:ifood_flutter_exam/core/domain/services/http_service.dart';
import 'package:ifood_flutter_exam/core/utils/api_utils.dart';

class DioHttpService implements HttpService {
  late Dio _dio;
  DioHttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: API.baseURL,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhY2UyMzNmNTEzM2Q1Y2E3NzAzNmVhOTFhM2YxYWQ1MiIsInN1YiI6IjYyNWUwY2JiZGY4NmE4MmVhZWFmNGYxNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LcH8WlLFywjoeyn06wOD_MCS7DqJ0OnTz3mDkOq2D6w',
      },
    ));
  }

  @override
  Future<Response<T>> get<T>(String url) {
    return _dio.get(url);
  }
}
