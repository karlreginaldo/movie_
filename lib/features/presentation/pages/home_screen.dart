import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/presentation/movie_carousel_cubit/movie_carousel_cubit.dart';
import 'package:movie_app/features/presentation/pages/movie_carousel_widget.dart';

import '../../../dipendency_indection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselCubit movieCarouselBloc;

  @override
  void initState() {
    movieCarouselBloc = sl<MovieCarouselCubit>();
    movieCarouselBloc.getTrending();
    super.initState();
  }

  @override
  void dispose() {
    movieCarouselBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieCarouselCubit>(
      create: (context) => movieCarouselBloc,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white),
        body: BlocBuilder<MovieCarouselCubit, MovieCarouselState>(
          bloc: movieCarouselBloc,
          builder: (context, state) {
            if (state is MovieCarouselLoaded) {
              print(state.movies);
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
              return Container(
                child: Center(child: CircularProgressIndicator()),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
