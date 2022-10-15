import 'package:json_annotation/json_annotation.dart';

part 'hotand_new_resp.g.dart';

@JsonSerializable()
class HotandNewResp {
  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'results')
  List<HotandNewData> results;

  HotandNewResp({this.page, this.results = const []});

  factory HotandNewResp.fromJson(Map<String, dynamic> json) {
    return _$HotandNewRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotandNewRespToJson(this);
}

@JsonSerializable()
class HotandNewData {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  String? originalTitle;

//in case of tv services ,use original name instaed of original title
  @JsonKey(name: 'original_name')
  String? originalName;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'release_date')
  String? releaseDate;

  @JsonKey(name: 'title')
  String? title;

  HotandNewData({
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  factory HotandNewData.fromJson(Map<String, dynamic> json) {
    return _$HotandNewDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotandNewDataToJson(this);
}
