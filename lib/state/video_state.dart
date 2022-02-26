import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:re_re_ca/model/entity/video/video.dart';

part 'video_state.freezed.dart';

@freezed
class VideoState with _$VideoState {
  const factory VideoState({@Default([]) List<Video> videoList}) = _VideoState;
}
