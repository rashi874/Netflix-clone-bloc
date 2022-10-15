import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/apllication/downloads/downloads_bloc.dart';
import 'package:netflix_clone/apllication/fast_laugh/fastlaugh_bloc.dart';
import 'package:netflix_clone/apllication/hot_and_new/hotandnew_bloc.dart';
import 'package:netflix_clone/apllication/search/search_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/domain/core/di/injectable.dart';

import 'package:netflix_clone/presentation/main_page/screen_main_page.dart';

import 'apllication/home/home_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<DownloadsBloc>()),
        BlocProvider(create: (ctx) => getIt<SearchBloc>()),
        BlocProvider(create: (ctx) => getIt<FastlaughBloc>()),
        BlocProvider(create: (ctx) => getIt<HotandnewBloc>()),
        BlocProvider(create: (ctx) => getIt<HomeBloc>()),
      ],
      child: MaterialApp(
        title: 'Netflix Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          primarySwatch: Colors.red,
          backgroundColor: Colors.black,
          scaffoldBackgroundColor: backgroundColor,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
          ),
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}
