import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:re_re_ca/model/entity/music/music.dart';
import 'package:re_re_ca/model/entity/video/video.dart' as entity;
import 'package:re_re_ca/model/repository_imf/music_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class MusicRepository extends IMusicRepository {
  final YoutubeExplode yt = YoutubeExplode();

  @override
  Future<Music> downLoadMusic(String url) async {
    print("ダウンロード開始");
    try {
      final myDirectory = await getApplicationDocumentsDirectory();
      final path = myDirectory.path;

      // final YoutubeExplode yt = YoutubeExplode();
      //動画の情報をl一括取得
      final video = await yt.videos.get(url);
      final manifest = await yt.videos.streamsClient.getManifest(url);
      final streamAudioInfo = manifest.audioOnly;
      final audio = streamAudioInfo.first;
      final stream = yt.videos.streamsClient.get(audio);
      //動画のタイトルを取得し、余分な文字列を削除。
      final musicTitle = '${video.title}.${audio.container.name}'
          .replaceAll(r'\', '')
          .replaceAll('/', '')
          .replaceAll('*', '')
          .replaceAll('?', '')
          .replaceAll('"', '')
          .replaceAll('<', '')
          .replaceAll('>', '')
          .replaceAll('|', '');
      final Music music = Music(
        title: musicTitle,
        author: video.author,
        image: video.thumbnails.standardResUrl,
      );
      final directory = Directory('$path/musics/');
      await directory.create(recursive: true);

      //まだ音楽がダウンロードされていない場合。
      if (await File('$path/musics/$musicTitle').exists() != true) {
        //ディレクトリの作成
        //ファイルの作成
        final musicFile = File('$path/musics/$musicTitle');
        final outPut = musicFile.openWrite(mode: FileMode.writeOnlyAppend);

        double count = 0;
        final len = audio.size.totalBytes;
        //したの処理を待たずに行ってしまう。けどダウンロードはできている。
        await for (final data in stream) {
          count += data.length;
          var progress = ((count / len) * 100).ceil();
          print(progress);
          outPut.add(data);
        }
        await saveMusic(music);
        await outPut.flush();
        await outPut.close();
        // stream.listen((data) {
        //   count += data.length;
        //   var progress = ((count / len) * 100).ceil();
        //   print(progress);
        //   outPut.add(data);
        // }, onDone: () async {
        //   //ミュージックの保存。
        //   await saveMusic(music);
        //   await outPut.flush();
        //   await outPut.close();
        // }, onError: (error) async {
        //   musicFile.deleteSync();
        //   await outPut.flush();
        //   await outPut.close();
        // });
      }
      return music;
    } catch (error) {
      print(error);
      return Future.error(error);
    }
  }

  Future<void> saveMusic(Music music) async {
    try {
      final SharedPreferences _preferences =
          await SharedPreferences.getInstance();

      //データを取得し、Dart方に変更する。
      final List<String> _musicsString =
          _preferences.getStringList('musics') ?? [];
      final List<Music> _musicList = _musicsString
          .map((musicJson) => Music.fromJson(jsonDecode(musicJson)))
          .toList();
      //保存したいデータを追加
      _musicList.add(music);
      //Dart型をList<String>に変更する。
      final List<String> _musicsJson =
          _musicList.map((music) => jsonEncode(music.toJson())).toList();
      //データを保存。
      await _preferences.setStringList('musics', _musicsJson);
    } catch (error) {
      print(error);
      return Future.error(error);
    }
  }

  @override
  Future<void> saveListMusic(List<Music> musicList) async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    final List<String> _musicsJson =
        musicList.map((music) => jsonEncode(music.toJson())).toList();
    //データを保存。
    await _preferences.setStringList('musics', _musicsJson);
  }

  @override
  Future<List<Music>> getListMusics() async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    //データを取得し、Dart方に変更する。
    final List<String> _musicsString =
        _preferences.getStringList('musics') ?? [];
    final List<Music> _musicList = _musicsString
        .map((musicJson) => Music.fromJson(jsonDecode(musicJson)))
        .toList();
    return _musicList;
  }

  // @override
  // //ビデオリスト取得
  // Future<List<entity.Video>> searchVideo(String query) async {
  //   final YoutubeExplode yt = YoutubeExplode();
  //   final searchList = await yt.search.getVideos(query);
  //   final List<entity.Video> videoList = searchList
  //       .map((vi) => entity.Video(
  //           url: vi.url,
  //           title: vi.title,
  //           author: vi.author,
  //           thumnail: vi.thumbnails,
  //           duration: vi.duration!))
  //       .toList();
  //   return videoList;
  // }

  @override
  Future<void> deleteMusic(String musicTitle) async {
    final myDirectory = await getApplicationDocumentsDirectory();
    final path = myDirectory.path;
    final musicFile = File('$path/musics/$musicTitle');
    musicFile.deleteSync();
  }
}
