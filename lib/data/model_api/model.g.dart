// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      videoId: json['id'] as String,
      urlImage: json['snippet']['thumbnails']['high']['url'] as String,
      title: json['snippet']['title'],
      channelTitle: json['snippet']['channelTitle'],
      viewCount: Model.viewCountSetting(json['statistics']['viewCount']),
      duration: Model.formatDuration(json['contentDetails']['duration']),
      dataTime: Model.timePublished( json['snippet']['publishedAt']),
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'videosId': instance.videoId,
      'urlImage': instance.urlImage,
      'title': instance.title,
      'channelTitle': instance.channelTitle,
    };
