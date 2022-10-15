import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/apllication/home/home_bloc.dart';

import 'package:netflix_clone/core/constant.dart';

import 'package:netflix_clone/presentation/home/widgets/background_card.dart';

import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';

import 'package:netflix_clone/presentation/widget/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              // print(direction);
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    } else if (state.hasError) {
                      return const Text(
                        'Error while getting data',
                        style: TextStyle(color: Colors.white),
                      );
                    }
                    //released past year

                    final _releasedPastyear = state.pastYearMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();

                    // trending

                    final _trending = state.trendingMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    // tense dramas
                    final _tenseDramas = state.tenseDramaMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    // south indian movies
                    final _southIndianMovies =
                        state.southIndianMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _southIndianMovies.shuffle();

                    //Top 10  tv shows
                    final _top10Tvshow = state.trendingMovieList.map((t) {
                      return '$imageAppendUrl${t.posterPath}';
                    }).toList();
                    _top10Tvshow.shuffle();
                    //listview
                    return ListView(
                      children: [
                        const BackgroundCard(),
                        kHeight,
                        MainTitlecard(
                          title: "Released in the past year",
                          posterList: _releasedPastyear,
                        ),
                        kHeight,
                        MainTitlecard(
                          title: "Trending now",
                          posterList: _trending,
                        ),
                        kHeight,
                        NumberTitleCard(
                          // postersLists: _top10Tvshow.sublist(0, 12),
                          postersLists: _top10Tvshow,
                        ),
                        kHeight,
                        MainTitlecard(
                          title: "Tense Dramas",
                          posterList: _tenseDramas,
                        ),
                        kHeight,
                        MainTitlecard(
                          title: "South indian cinemas",
                          posterList: _southIndianMovies,
                        ),
                        kHeight,
                      ],
                    );
                  },
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 1000,
                        ),
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(0.1),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  "https://cdn-images-1.medium.com/max/1200/1*ty4NvNrGg4ReETxqU2N3Og.png",
                                  width: 55,
                                  height: 55,
                                ),

                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                ),
                                kwidth,
                                Image.network(
                                  "http://zoeice.com/assets/img/uploads/profile.png",
                                  width: 30,
                                  height: 30,
                                ),
                                // Container(
                                //   width: 30,
                                //   height: 30,
                                //   color: Colors.blue,
                                // ),
                                kwidth,
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Tv Shows',
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  'Movies',
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  'Categories',
                                  style: kHomeTitleText,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : kHeight
              ],
            ),
          );
        },
      ),
    );
  }
}
