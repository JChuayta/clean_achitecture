import 'package:digital_banking/src/modules/digitalBanking/movie/domain/entities/movie.dart';
import 'package:digital_banking/src/modules/digitalBanking/movie/domain/usecases/get_movie.dart';
import 'package:digital_banking/src/modules/digitalBanking/movie/presentation/bloc/movie_bloc.dart';
import 'package:digital_banking/src/modules/digitalBanking/movie/presentation/pages/movie.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CleanPage extends StatefulWidget {
  @override
  _CleanPageState createState() => _CleanPageState();
}

class _CleanPageState extends State<CleanPage> {
  List<Movie> movies;
  GetMovies getMovies;

  _loaded() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async* {
      final state = BlocProvider.of<MovieBloc>(context).state;
      if (state is GetMovie) {
        final List<Movie> movie = await getMovies();
        yield* _LoadedState(movie);
      }
    });
  }

  Stream<MovieState> _LoadedState(List<Movie> movie) async* {
    yield Loaded(movie: movie);
  }

  @override
  void initState() {
    super.initState();
    print("object");
    _loaded();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is Empty) {
            // return Text("data");
            getMovie();
          }
          return Center();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.movie),
        onPressed: () => {
          BlocProvider.of<MovieBloc>(context).add(
            GetMovie(movies),
          ),
        },
      ),
    );
  }

  getMovie() async {
    final List<Movie> movie = await getMovies();
    return _LoadedState(movie);
  }
}
