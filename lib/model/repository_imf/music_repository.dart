import 'package:re_re_ca/model/entity/music/music.dart';
import 'package:re_re_ca/model/entity/video/video.dart' as entity;
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

abstract class IMusicRepository {
  Future<Music> downLoadMusic(String url);

  Future<List<entity.Video>> searchVideo(String query);

  Future<List<Music>> getListMusics();

  Future<void> saveListMusic(List<Music> musicList);

  Future<void> deleteMusic(String musicTitle);
}
