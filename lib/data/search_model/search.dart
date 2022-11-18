
import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';

@JsonSerializable()
class SearchModel {
  final String? videoId;

  SearchModel({
    required this.videoId,
  });


  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return _$ModelFromJson(json);
  }
}
