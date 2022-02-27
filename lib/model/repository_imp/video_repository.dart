import 'package:re_re_ca/model/entity/video/video.dart' as entity;
import 'package:re_re_ca/model/repository_imf/video_repository.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class VideoRepository extends IVideoRepository {
  //ビデオリスト取得
  @override
  Future<List<entity.Video>> searchVideo(String query) async {
    final YoutubeExplode yt = YoutubeExplode();
    final searchList = await yt.search.getVideos(query);
    final List<entity.Video> videoList = searchList
        .map((vi) => entity.Video(
            url: vi.url,
            title: vi.title,
            author: vi.author,
            thumnail: vi.thumbnails,
            duration: vi.duration!))
        .toList();
    return videoList;
  }
}
