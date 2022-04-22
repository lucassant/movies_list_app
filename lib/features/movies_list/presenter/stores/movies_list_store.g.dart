// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MoviesListStore on _MoviesListStoreBase, Store {
  late final _$movieEntityAtom =
      Atom(name: '_MoviesListStoreBase.movieEntity', context: context);

  @override
  MovieEntity? get movieEntity {
    _$movieEntityAtom.reportRead();
    return super.movieEntity;
  }

  @override
  set movieEntity(MovieEntity? value) {
    _$movieEntityAtom.reportWrite(value, super.movieEntity, () {
      super.movieEntity = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_MoviesListStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getMoviesAsyncAction =
      AsyncAction('_MoviesListStoreBase.getMovies', context: context);

  @override
  Future<void> getMovies() {
    return _$getMoviesAsyncAction.run(() => super.getMovies());
  }

  late final _$_MoviesListStoreBaseActionController =
      ActionController(name: '_MoviesListStoreBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_MoviesListStoreBaseActionController.startAction(
        name: '_MoviesListStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_MoviesListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movieEntity: ${movieEntity},
isLoading: ${isLoading}
    ''';
  }
}
