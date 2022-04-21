import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_flutter_exam/core/domain/error/exceptions.dart';
import 'package:ifood_flutter_exam/core/domain/error/failures.dart';
import 'package:ifood_flutter_exam/features/movies_list/domain/entities/movie_entity.dart';
import 'package:ifood_flutter_exam/features/movies_list/domain/repositories/movies_list_repository.dart';
import 'package:ifood_flutter_exam/features/movies_list/infra/adapters/json_to_movie_entity.dart';
import 'package:ifood_flutter_exam/features/movies_list/infra/datasources/get_movies_datasource.dart';
import 'package:ifood_flutter_exam/features/movies_list/infra/repositories/movies_list_repository_imp.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/movies_list_mock.dart';
import 'movies_list_repository_test.mocks.dart';

@GenerateMocks([MoviesListRepository, GetMoviesDatasource])
void main() {
  late MockGetMoviesDatasource mockGetMoviesDatasource;
  late MoviesListRepository moviesListRepository;

  setUp(() {
    mockGetMoviesDatasource = MockGetMoviesDatasource();
    moviesListRepository =
        MoviesListRepositoryImp(getMoviesDatasource: mockGetMoviesDatasource);
  });

  group('moviesListRepository:', () {
    test('should return a MovieEntity when the call is successful', () async {
      late MovieEntity tMovieEntity;

      when(mockGetMoviesDatasource()).thenAnswer((_) async {
        Map map = json.decode(getMoviesMock);
        tMovieEntity = JsonToMovieEntity.fromMap(map);
        return map;
      });

      final result = await moviesListRepository.getMovies();

      final MovieEntity expected = result.toIterable().single;

      verify(mockGetMoviesDatasource());

      expect(expected.name, equals(tMovieEntity.name));
    });

    test('should return a server failure when the call is unsuccessful',
        () async {
      when(mockGetMoviesDatasource()).thenThrow(ServerException());

      final result = await moviesListRepository.getMovies();

      final serverFailure = result.fold((l) => ServerFailure(), (r) => r);

      verify(mockGetMoviesDatasource());
      expect(serverFailure, isInstanceOf<ServerFailure>());
    });
  });
}
