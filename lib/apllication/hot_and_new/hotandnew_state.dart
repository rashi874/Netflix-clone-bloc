part of 'hotandnew_bloc.dart';

@freezed
class HotandnewState with _$HotandnewState {
  const factory HotandnewState({
    required List<HotandNewData> comingsoonList,
    required List<HotandNewData> everyOneIsWatchingList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory HotandnewState.initial() => const HotandnewState(
        comingsoonList: [],
        everyOneIsWatchingList: [],
        isLoading: false,
        hasError: false,
      );
}
