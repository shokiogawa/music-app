import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:re_re_ca/model/entity/video/video.dart';
import 'package:re_re_ca/model/repository_imf/music_repository.dart';
import 'package:re_re_ca/state/video_state.dart';

class VideoViewModel extends StateNotifier<VideoState> {
  final IMusicRepository _musicRepository;

  VideoViewModel(this._musicRepository) : super(const VideoState());

  Future<void> getVideoLists(String query) async {
    final List<Video> videos = await _musicRepository.searchVideo(query);
    state = state.copyWith(videoList: videos);
  }
}
