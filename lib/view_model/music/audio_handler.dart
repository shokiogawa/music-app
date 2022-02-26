import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:re_re_ca/model/repository_imf/music_repository.dart';
import 'package:re_re_ca/model/repository_imp/music_repository.dart';

import '../../model/entity/music/music.dart';

class AudioHandlerViewModel extends BaseAudioHandler with SeekHandler {
  final _player = AudioPlayer();
  final _playList = ConcatenatingAudioSource(children: []);

  AudioHandlerViewModel() {
    _loadEmptyPlaylist();
    _notifyAudioHandlerAboutPlaybackEvents();
    _listenForDurationChanges();
  }

  Future<void> _loadEmptyPlaylist() async {
    try {
      await _player.setAudioSource(_playList);
    } catch (e) {
      print(e);
      Future.error(e);
    }
  }

  //バックグラウンドで通知するもの。
  //just_audioとaudio_serviceの虫びつけを行なっていると思ってもいい。
  void _notifyAudioHandlerAboutPlaybackEvents() {
    _player.playbackEventStream.listen((PlaybackEvent event) {
      final playing = _player.playing;
      playbackState.add(playbackState.value.copyWith(
        controls: [
          MediaControl.skipToPrevious,
          if (playing) MediaControl.pause else MediaControl.play,
          MediaControl.stop,
          MediaControl.skipToNext,
        ],
        //特定のボタンを持たないアクション
        systemActions: const {
          MediaAction.seek,
        },
        //0: previous、 1: 再生、2: 止める、 3: next
        androidCompactActionIndices: const [0, 1, 3],
        processingState: const {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[_player.processingState]!,
        repeatMode: const {
          LoopMode.off: AudioServiceRepeatMode.none,
          LoopMode.one: AudioServiceRepeatMode.one,
          LoopMode.all: AudioServiceRepeatMode.all,
        }[_player.loopMode]!,
        shuffleMode: (_player.shuffleModeEnabled)
            ? AudioServiceShuffleMode.all
            : AudioServiceShuffleMode.none,
        playing: playing,
        //just_audioをaudio_serviceに知らせる。
        updatePosition: _player.position,
        bufferedPosition: _player.bufferedPosition,
        queueIndex: event.currentIndex,
      ));
    });
  }

  void _listenForDurationChanges() {
    _player.durationStream.listen((duration) {
      final index = _player.currentIndex;
      final newQue = queue.value;
      if (index == null || newQue.isEmpty) return;
      final oldMediaItem = newQue[index];
      final newMediaItem = oldMediaItem.copyWith(duration: duration);
      newQue[index] = newMediaItem;
      queue.add(newQue);
      mediaItem.add(newMediaItem);
      // print("-----------------------");
      // print(index);
      // print(newQue);
      // print(oldMediaItem);
      // print(newMediaItem);
      // print("-----------------------");
    });
  }

  Future<void> setPlayList(List<MediaItem> mediaItems) async {
    Future.forEach(mediaItems, (MediaItem mediaItem) async {
      final _audioSource = await _createAudioSource(mediaItem.title);
      _playList.add(_audioSource);
    });
    await _player.setAudioSource(_playList);
  }

  Future<void> tapMusic(int index) async {
    print(index);
    await _player.seek(Duration.zero, index: index);
    if (!_player.playing) {
      await play();
    }
  }

  @override
  Future<void> play() async {
    // await _player.setAudioSource(_playList);
    // TODO: implement play
    await _player.play();
    return super.play();
  }

  @override
  Future<void> pause() async {
    // TODO: implement pause
    await _player.pause();
    return super.pause();
  }

  @override
  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  @override
  Future<void> skipToNext() async {
    // TODO: implement skipToNext
    await _player.seekToNext();
    return super.skipToNext();
  }

  @override
  Future<void> skipToPrevious() async {
    // TODO: implement skipToPrevious
    await _player.seekToPrevious();
    return super.skipToPrevious();
  }

  @override
  Future<void> stop() async {
    // TODO: implement stop
    await _player.stop();
    return super.stop();
  }

  @override
  Future<void> addQueueItems(List<MediaItem> mediaItems) async {
    Future.forEach(mediaItems, (MediaItem mediaItem) async {
      final _audioSource = await _createAudioSource(mediaItem.title);
      await _playList.add(_audioSource);
    });
    // notify system
    final newQueue = queue.value..addAll(mediaItems);
    queue.add(newQueue);
  }

  @override
  Future<void> addQueueItem(MediaItem mediaItem) async {
    final _audioSource = await _createAudioSource(mediaItem.title);
    await _playList.add(_audioSource);

    final newQue = queue.value..add(mediaItem);
    queue.add(newQue);
    print(_playList);
    print(queue.value);
  }

  @override
  Future<void> removeQueueItemAt(int index) async {
    await _playList.removeAt(index);
    print(_playList.children);
    final newQueue = queue.value..removeAt(index);
    print(newQueue);
    queue.add(newQueue);
  }

  Future<void> clear() async {
    await _playList.clear();
  }

  Future<UriAudioSource> _createAudioSource(String musicName) async {
    final directory = await getApplicationDocumentsDirectory();
    String _path = directory.path;
    String _musicPath = '$_path/musics/$musicName';
    return AudioSource.uri(Uri.file(_musicPath));
  }
}
