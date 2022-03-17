import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/presentation/cubit/movie_carousel_cubit.dart';
import 'core/themes/app_color.dart';
import 'core/themes/theme_text.dart';
import 'dipendency_indection.dart' as getit;
import 'dipendency_indection.dart';
import 'features/presentation/pages/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getit.init();
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.vulcan,
        scaffoldBackgroundColor: AppColor.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: BlocProvider<MovieCarouselCubit>(
        create: (context) => sl<MovieCarouselCubit>()..getTrending(),
        child: HomeScreen(),
      ),
    );
  }
}
