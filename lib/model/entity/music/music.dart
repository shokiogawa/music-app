import 'package:audio_service/audio_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// `{ファイル名}.freezed.dart` と書きます。
part 'music.freezed.dart';

part 'music.g.dart';

@freezed
class Music with _$Music {
  const factory Music({
    required String title,
    required String author,
    required String image,
  }) = _Music;

  factory Music.fromJson(Map<String, dynamic> json) => _$MusicFromJson(json);
}

@freezed
class ProgressBarState with _$ProgressBarState {
  const factory ProgressBarState({
    required Duration current,
    required Duration buffered,
    required Duration total,
  }) = _ProgressBarState;
}
