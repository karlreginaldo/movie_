import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/presentation/bloc/movie_carousel_bloc.dart';
import 'package:movie_app/features/presentation/pages/movie_carousel_widget.dart';

import '../../../dipendency_indection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;

  @override
  void initState() {
    movieCarouselBloc = sl<MovieCarouselBloc>();
    movieCarouselBloc.add(CarouselLoadEvent());
    super.initState();
  }

  @override
  void dispose() {
    movieCarouselBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieCarouselBloc>(
      create: (context) => movieCarouselBloc,
      child: Scaffold(
        body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
          bloc: movieCarouselBloc,
          builder: (context, state) {
            if (state is MovieCarouselLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.6,
                    child: MovieCarouselWidget(
                        movies: state.movies, defaultIndex: state.defaultIndex),
                  ),
                  FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.4,
                    child: Placeholder(color: Colors.grey),
                  ),
                ],
              );
            } else if (state is MovieCarouselLoading) {
              return Container();
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
