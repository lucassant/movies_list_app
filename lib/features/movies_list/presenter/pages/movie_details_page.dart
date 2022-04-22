import 'package:flutter/material.dart';

import '../../../../core/utils/api_utils.dart';
import '../../domain/entities/movie_details_entity.dart';

class MovieDetailsPage extends StatelessWidget {
  final MovieDetailsEntity movie;
  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .50,
              child: Hero(
                tag: movie.id,
                child: Image.network(
                  API.imageURL + movie.posterPath,
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              movie.overview,
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Title: '),
                Text(movie.originalTitle),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Release date:'),
                Text(
                  movie.releaseDate,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('User Rating:'),
                Text('${(movie.voteAverage * 10).toInt()}%'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
