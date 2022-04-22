import 'package:flutter/material.dart';
import 'package:ifood_flutter_exam/core/utils/api_utils.dart';
import 'package:ifood_flutter_exam/features/movies_list/domain/entities/movie_details_entity.dart';

import '../pages/movie_details_page.dart';

class MoviesListCardWidget extends StatelessWidget {
  final MovieDetailsEntity movie;
  const MoviesListCardWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => MovieDetailsPage(movie: movie)));
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Hero(
                  tag: movie.id,
                  child: Image.network(
                    API.imageURL + movie.posterPath,
                    width: 70,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      movie.releaseDate,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Popularity: ${movie.popularity}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'User Rating: ${(movie.voteAverage * 10).toInt()}%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
