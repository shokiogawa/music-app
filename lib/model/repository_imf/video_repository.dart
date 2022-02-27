import 'package:re_re_ca/model/entity/music/music.dart';
import 'package:re_re_ca/model/entity/video/video.dart' as entity;

abstract class IVideoRepository {
  Future<List<entity.Video>> searchVideo(String query);
}
