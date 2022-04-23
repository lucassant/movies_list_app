import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_list_app/core/domain/error/exceptions.dart';
import 'package:movies_list_app/core/domain/error/failures.dart';
import 'package:movies_list_app/core/infra/network_info.dart';
import 'package:movies_list_app/features/movies_list/domain/entities/movie_entity.dart';
import 'package:movies_list_app/features/movies_list/domain/repositories/movies_list_repository.dart';
import 'package:movies_list_app/features/movies_list/infra/adapters/json_to_movie_entity.dart';
import 'package:movies_list_app/features/movies_list/infra/datasources/movies_local_datasource.dart';
import 'package:movies_list_app/features/movies_list/infra/datasources/movies_remote_datasource.dart';
import 'package:movies_list_app/features/movies_list/infra/repositories/movies_list_repository_imp.dart';

import '../../mocks/movies_list_mock.dart';
import 'movies_list_repository_test.mocks.dart';

@GenerateMocks([
  MoviesListRepository,
  MoviesRemoteDatasource,
  MoviesLocalDatasource,
  NetworkInfo
])
void main() {
  late MockMoviesRemoteDatasource mockMoviesRemoteDatasource;
  late MockMoviesLocalDatasource mockMoviesLocalDatasource;
  late MockNetworkInfo mockNetworkInfo;
  late MoviesListRepository moviesListRepository;

  setUp(() {
    mockMoviesRemoteDatasource = MockMoviesRemoteDatasource();
    mockMoviesLocalDatasource = MockMoviesLocalDatasource();
    mockNetworkInfo = MockNetworkInfo();

    moviesListRepository = MoviesListRepositoryImp(
        moviesRemoteDatasource: mockMoviesRemoteDatasource,
        moviesLocalDatasource: mockMoviesLocalDatasource,
        networkInfo: mockNetworkInfo);
  });

  group('moviesListRepository:', () {
    test('should check if device is online', (() async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      final result = await mockNetworkInfo.isConnected;

      verify(mockNetworkInfo.isConnected);
      expect(result, true);
    }));

    test('should check if device is offline', (() async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      final result = await mockNetworkInfo.isConnected;

      verify(mockNetworkInfo.isConnected);
      expect(result, false);
    }));

    group('device is online -', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test(
          'should return a MovieEntity when the call to remote data is successful',
          () async {
        late MovieEntity tMovieEntity;

        when(mockMoviesRemoteDatasource.getMovies()).thenAnswer((_) async {
          Map map = json.decode(getMoviesMock);
          tMovieEntity = JsonToMovieEntity.fromMap(map);
          return map;
        });

        final result = await moviesListRepository.getMovies();

        final MovieEntity expected = result.toIterable().single;

        verify(mockMoviesRemoteDatasource.getMovies());

        expect(expected.id, equals(tMovieEntity.id));
      });

      test('should return a ServerFailure when the call is unsuccessful',
          () async {
        when(mockMoviesRemoteDatasource.getMovies())
            .thenThrow(ServerException());

        final result = await moviesListRepository.getMovies();

        final failure = result.fold((l) => ServerFailure(), (r) => r);

        expect(failure, isInstanceOf<ServerFailure>());
      });
    });

    group('device is offline -', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      test(
          'should return a MovieEntity when the call to local data is successful',
          () async {
        late MovieEntity tMovieEntity;

        when(mockMoviesLocalDatasource.getMovies()).thenAnswer((_) async {
          Map map = json.decode(getMoviesMock);
          tMovieEntity = JsonToMovieEntity.fromMap(map);
          return map;
        });

        final result = await moviesListRepository.getMovies();

        final MovieEntity expected = result.toIterable().single;

        verify(mockMoviesLocalDatasource.getMovies());

        expect(expected.id, equals(tMovieEntity.id));
      });

      test('should return a LocalCacheFailure when the call is unsuccessful',
          () async {
        when(mockMoviesLocalDatasource.getMovies())
            .thenThrow(LocalCacheException());

        final result = await moviesListRepository.getMovies();

        final failure = result.fold((l) => LocalCacheFailure(), (r) => r);

        expect(failure, isInstanceOf<LocalCacheFailure>());
      });
    });
  });
}
