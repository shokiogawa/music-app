import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:re_re_ca/model/entity/video/video.dart';
import 'package:re_re_ca/model/repository_imf/music_repository.dart';
import 'package:re_re_ca/model/repository_imf/video_repository.dart';
import 'package:re_re_ca/state/video_state.dart';

class VideoViewModel extends StateNotifier<VideoState> {
  final IVideoRepository _videoRepository;

  VideoViewModel(this._videoRepository) : super(const VideoState());

  Future<void> getVideoLists(String query) async {
    final List<Video> videos = await _videoRepository.searchVideo(query);
    state = state.copyWith(videoList: videos);
  }

  @override
  void dispose(){
    super.dispose();
  }
}
