import 'package:hive_flutter/adapters.dart';

import '../../../../core/domain/error/exceptions.dart';
import '../../infra/datasources/movies_local_datasource.dart';

class MoviesLocalDatasourceImp implements MoviesLocalDatasource {
  final HiveInterface hive;
  late Box<Map> _moviesBox;
  final String _key = 'movies';

  MoviesLocalDatasourceImp(this.hive) {
    _moviesBox = hive.box(_key);
  }

  @override
  Future<Map> getMovies() async {
    final Map? jsonMovieEntity = _moviesBox.get(_key);

    if (jsonMovieEntity != null) {
      return jsonMovieEntity;
    } else {
      throw LocalCacheException();
    }
  }

  @override
  Future<void> saveMovies(Map jsonModel) async {
    return await _moviesBox.put(_key, jsonModel);
  }
}
