import 'package:flutter/material.dart';
import 'package:ifood_flutter_exam/features/movies_list/domain/usecases/get_movies_usecase.dart';
import 'package:ifood_flutter_exam/features/movies_list/presenter/stores/movies_list_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ifood_flutter_exam/features/movies_list/presenter/widgets/movies_list_card_widget.dart';
import 'package:provider/provider.dart';

class MoviesListPage extends StatefulWidget {
  const MoviesListPage({Key? key}) : super(key: key);

  @override
  State<MoviesListPage> createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  late MoviesListStore store;

  @override
  void initState() {
    store = MoviesListStore(context.read<GetMoviesUsecase>());
    store.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies List'),
      ),
      body: Observer(
        builder: (_) => store.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : store.movieEntity == null
                ? const Center(
                    child: Text('No movies found'),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: store.movieEntity!.moviesList.length,
                      itemBuilder: (_, index) => ListTile(
                        title: MoviesListCardWidget(
                          movie: store.movieEntity!.moviesList[index],
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
