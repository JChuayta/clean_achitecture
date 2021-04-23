import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'src/modules/digitalBanking/movie/presentation/pages/movie.page.dart';
import 'package:digital_banking/src/modules/digitalBanking/movie/presentation/bloc/movie_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => new MovieBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo Architecture',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: MoviePage(),
      ),
    );
  }
}
