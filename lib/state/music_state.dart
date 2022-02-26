import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/entity/music/music.dart';

part 'music_state.freezed.dart';

@freezed
class MusicState with _$MusicState {
  const factory MusicState({
    @Default([]) List<Music> musicList,
    @Default(
        ProgressBarState(
            current: Duration.zero,
            buffered: Duration.zero,
            total: Duration.zero))
        ProgressBarState progressBarState,
    @Default("") String musicTitle,
    @Default(false) bool isPlaying,
  }) = _MusicState;
}
