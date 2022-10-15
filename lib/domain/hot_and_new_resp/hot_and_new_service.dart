import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/hot_and_new_resp/model/hotand_new_resp.dart';

abstract class HotandNewService {
  Future<Either<MainFailure, HotandNewResp>> getHotAndNewMovieData();
  Future<Either<MainFailure, HotandNewResp>> getHotAndNewTvData();
}
