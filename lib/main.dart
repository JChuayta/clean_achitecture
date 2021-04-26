import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/modules/digitalBanking/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'src/modules/digitalBanking/movie/presentation/pages/movie.page.dart';
import 'package:digital_banking/src/modules/digitalBanking/movie/presentation/bloc/movie_bloc.dart';

import 'src/modules/digitalBanking/movie/presentation/widgets/clean.dart';
import 'src/modules/digitalBanking/movie/presentation/widgets/loading_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Architecture',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: buildBody(context),
    );
  }

  BlocProvider<MovieBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => di.inject<MovieBloc>(),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is Empty) {
            return CleanPage();
          } else if (state is Loading) {
            return LoadingWidget();
          } else if (state is Loaded) {
            return MoviePage(movies: state.movie);
          }
        },
      ),
    );
  }
}
