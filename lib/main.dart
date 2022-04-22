import 'package:flutter/material.dart';
import 'package:ifood_flutter_exam/features/movies_list/movies_list_module.dart';
import 'package:ifood_flutter_exam/features/movies_list/presenter/pages/movies_list_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...moviesListModule,
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const MoviesListPage(),
      ),
    );
  }
}
