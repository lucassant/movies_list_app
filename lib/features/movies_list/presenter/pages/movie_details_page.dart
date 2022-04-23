import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/api_utils.dart';
import '../../domain/entities/movie_details_entity.dart';

class MovieDetailsPage extends StatefulWidget {
  final MovieDetailsEntity movie;
  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .50,
              child: Hero(
                tag: widget.movie.id,
                child: CachedNetworkImage(
                  imageUrl: API.imageURL + widget.movie.posterPath,
                  placeholder: (context, url) =>
                      Image.asset('assets/placeholder.png'),
                  errorWidget: (context, url, error) {
                    log(error.toString());
                    return Image.asset('assets/placeholder.png');
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              widget.movie.overview,
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            _buildTextRow('Title:', widget.movie.originalTitle),
            const SizedBox(height: 8),
            _buildTextRow('Release date:', widget.movie.releaseDate),
            const SizedBox(height: 8),
            _buildTextRow(
                'User Rating:', '${(widget.movie.voteAverage * 10).toInt()}%'),
            const SizedBox(height: 8),
            _buildTextRow(
                'Popularity:', widget.movie.popularity.ceil().toString()),
          ],
        ),
      ),
    );
  }

  Row _buildTextRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}
