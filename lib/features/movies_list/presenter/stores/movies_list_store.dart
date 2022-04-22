import 'package:ifood_flutter_exam/core/domain/usecases/usecase.dart';
import 'package:ifood_flutter_exam/features/movies_list/domain/entities/movie_entity.dart';
import 'package:ifood_flutter_exam/features/movies_list/domain/usecases/get_movies_usecase.dart';
import 'package:mobx/mobx.dart';

part 'movies_list_store.g.dart';

class MoviesListStore = _MoviesListStoreBase with _$MoviesListStore;

abstract class _MoviesListStoreBase with Store {
  final GetMoviesUsecase getMoviesUsecase;

  _MoviesListStoreBase(this.getMoviesUsecase);

  @observable
  MovieEntity? movieEntity;

  @observable
  bool isLoading = false;

  @action
  Future<void> getMovies() async {
    setLoading(true);

    final result = await getMoviesUsecase(NoParams());

    result.fold((l) => movieEntity = null, (r) => movieEntity = r);

    setLoading(false);
  }

  @action
  void setLoading(bool value) {
    isLoading = value;
  }
}
