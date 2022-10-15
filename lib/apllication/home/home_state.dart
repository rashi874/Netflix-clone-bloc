part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateId,
    required List<HotandNewData> pastYearMovieList,
    required List<HotandNewData> trendingMovieList,
    required List<HotandNewData> tenseDramaMovieList,
    required List<HotandNewData> southIndianMovieList,
    required List<HotandNewData> trendingTvList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory HomeState.initial() => const HomeState(
      stateId: '0',
      pastYearMovieList: [],
      trendingMovieList: [],
      tenseDramaMovieList: [],
      southIndianMovieList: [],
      trendingTvList: [],
      isLoading: false,
      hasError: false);
}
