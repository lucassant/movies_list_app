import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_flutter_exam/core/domain/usecases/usecase.dart';
import 'package:ifood_flutter_exam/features/movies_list/domain/entities/movie_entity.dart';
import 'package:ifood_flutter_exam/features/movies_list/domain/repositories/movies_list_repository.dart';
import 'package:ifood_flutter_exam/features/movies_list/domain/usecases/get_movies_usecase.dart';
import 'package:ifood_flutter_exam/features/movies_list/infra/adapters/json_to_movie_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/movies_list_mock.dart';
import 'get_movies_usecase_test.mocks.dart';

@GenerateMocks([MoviesListRepository])
void main() {
  late GetMoviesUsecase getMoviesUsecase;
  late MockMoviesListRepository moviesListRepository;

  setUp(() {
    moviesListRepository = MockMoviesListRepository();
    getMoviesUsecase =
        GetMoviesUsecase(moviesListRepository: moviesListRepository);
  });

  group('getMoviesUsecase:', () {
    final jsonEntity = json.decode(getMoviesMock);

    final tMovieEntity = JsonToMovieEntity.fromMap(jsonEntity);

    test('should get a MovieEntity', () async {
      when(moviesListRepository.getMovies())
          .thenAnswer((_) async => Right(tMovieEntity));

      final result = await getMoviesUsecase(NoParams());

      final MovieEntity expected = result.toIterable().single;

      expect(expected, tMovieEntity);
    });
  });
}
