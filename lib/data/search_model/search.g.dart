part of 'search.dart';

SearchModel _$ModelFromJson(Map<String, dynamic> json) => SearchModel(
      videoId: json['id']['videoId'] as String?,
    );
