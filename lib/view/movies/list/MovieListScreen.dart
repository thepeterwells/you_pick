import 'package:you_pick/data/models/Movie.dart';
import 'package:you_pick/utils/ColorUtil.dart';
import 'package:you_pick/view/custom/MovieListItem.dart';
import 'package:you_pick/view/movies/list/IMovieList.dart';
import 'package:you_pick/view/movies/list/MovieListPresenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieListScreen extends StatelessWidget {

  var presenter = MovieListPresenter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppTheme.primaryDarkColor,
        body: MovieListWidget(presenter: presenter),
      ),
    );
  }
}

class MovieListWidget extends StatefulWidget {

  final MovieListPresenter presenter;

  const MovieListWidget({required this.presenter});

  @override
  State createState() => MovieListState(presenter: presenter);
}

class MovieListState extends State<MovieListWidget> implements IMovieList {
  final MovieListPresenter presenter;
  bool _isLoading = true;
  ListView? _listView;

  MovieListState({required this.presenter});

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    WidgetsBinding.instance!.addPostFrameCallback((_) => presenter.start(this));
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryLightColor),
        ),
      );
    } else {
      return _listView ?? ListView();
    }
  }

  @override
  void openMovieDetails(int movieId, String title) {

  }

  @override
  void setDataItems(List<Movie> movies) {
    _listView = ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemBuilder: (context, index) {
        return MovieListItem(movies[index], presenter);
      },
      itemCount: movies.length,
    );
  }

  @override
  void showError() {

  }

  @override
  void hideProgress() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void showProgress() {
    setState(() {
      _isLoading = true;
    });
  }
}