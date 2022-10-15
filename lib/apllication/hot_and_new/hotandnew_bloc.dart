import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/hot_and_new_resp/hot_and_new_service.dart';
import 'package:netflix_clone/domain/hot_and_new_resp/model/hotand_new_resp.dart';

part 'hotandnew_event.dart';
part 'hotandnew_state.dart';
part 'hotandnew_bloc.freezed.dart';

@injectable
class HotandnewBloc extends Bloc<HotandnewEvent, HotandnewState> {
  final HotandNewService _hotandNewService;
  HotandnewBloc(this._hotandNewService) : super(HotandnewState.initial()) {
    //get  hot and new movie data

    on<LoadDataInComingSoon>((event, emit) async {
// send loading to ui

      // final newState = _result.fold((MainFailure failure) {
      emit(const HotandnewState(
        comingsoonList: [],
        everyOneIsWatchingList: [],
        isLoading: true,
        hasError: false,
      ));

      //get data from remote
      final _result = await _hotandNewService.getHotAndNewMovieData();

      // data to state

      final newState = _result.fold(
        (MainFailure failure) {
          return const HotandnewState(
            comingsoonList: [],
            everyOneIsWatchingList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotandNewResp resp) {
          return HotandnewState(
            comingsoonList: resp.results,
            everyOneIsWatchingList: state.everyOneIsWatchingList,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(newState);
    });

    //get  hot and new Tv data
    on<LoadDataInEveryoneIsWatching>((event, emit) async {
      //get  hot and new movie data

// send loading to ui

      // final newState = _result.fold((MainFailure failure) {
      emit(const HotandnewState(
        comingsoonList: [],
        everyOneIsWatchingList: [],
        isLoading: true,
        hasError: false,
      ));

      //get data from remote
      final _result = await _hotandNewService.getHotAndNewTvData();

      // data to state

      final newState = _result.fold(
        (MainFailure failure) {
          return const HotandnewState(
            comingsoonList: [],
            everyOneIsWatchingList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotandNewResp resp) {
          return HotandnewState(
            comingsoonList: state.comingsoonList,
            everyOneIsWatchingList: resp.results,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(newState);
    });
  }
}
