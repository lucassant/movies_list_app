abstract class MoviesLocalDatasource {
  Future<Map> getMovies();
  Future<void> saveMovies(Map jsonModel);
}
