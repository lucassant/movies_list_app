import 'package:dio/dio.dart';

import '../infra/http_service.dart';
import '../utils/api_utils.dart';

class DioHttpService implements HttpService {
  late Dio _dio;
  DioHttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: API.baseURL,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${API.tokenAuth}',
      },
    ));
  }

  @override
  Future<Response<T>> get<T>(String url) {
    return _dio.get(url);
  }
}
