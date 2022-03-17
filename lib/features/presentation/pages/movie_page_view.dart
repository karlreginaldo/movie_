import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/size_extension.dart';
import 'package:movie_app/features/domain/entities/movie_entity.dart';
import 'package:movie_app/features/presentation/widgets/movie_card_widget.dart';

import '../../../core/constants/size_constants.dart';
import '../../../core/utils/screen_utils.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;
  const MoviePageView(
      {Key? key, required this.movies, required this.initialPage})
      : super(key: key);

  @override
  State<MoviePageView> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: ScreenUtil.screenHeight * 0.35,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final MovieEntity movie = widget.movies[index];
          return MovieCardWidget(
              movieId: movie.id, posterPath: movie.posterPath);
        },
        pageSnapping: true,
        itemCount: widget.movies.length,
        onPageChanged: (index) {},
      ),
    );
  }
}
