import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:re_re_ca/model/entity/music/music.dart';
import 'package:re_re_ca/model/repository_imf/music_repository.dart';
import 'package:re_re_ca/state/music_state.dart';
import 'package:re_re_ca/view_model/music/audio_handler.dart';

class MusicManagerViewModel extends StateNotifier<MusicState> with WidgetsBindingObserver {
  final AudioHandlerViewModel _audioHandlerViewModel;
  final IMusicRepository _musicRepository;

  MusicManagerViewModel(this._audioHandlerViewModel, this._musicRepository)
      : super(const MusicState()){
    //クラス初期化時に呼ばれる。
    WidgetsBinding.instance!.addObserver(this);
  }

  void init() async {
    //音楽データ取得
    await _loadPlayList();
    //再生音楽のcurrent statusを取得
    _listenToCurrentPosition();
    _listenToBufferedPosition();
    _listenToTotalDuration();
    //音楽のタイトルを変更
    _listenToChangeMusic();
    //再生中かどうかを取得する。
    _listenToIsPlay();
  }

  Future<void> _loadPlayList() async {
    final List<Music> musicList = await _musicRepository.getListMusics();
    state = state.copyWith(musicList: musicList);
    final List<MediaItem> mediaItems = musicList
        .map((music) => MediaItem(id: music.title, title: music.title))
        .toList();
    await _audioHandlerViewModel.addQueueItems(mediaItems);
  }

  void _listenToCurrentPosition() {
    AudioService.position.listen((position) {
      final newState = ProgressBarState(
          current: position,
          buffered: state.progressBarState.buffered,
          total: state.progressBarState.total);
      state = state.copyWith(progressBarState: newState);
    });
  }

  void _listenToBufferedPosition() {
    _audioHandlerViewModel.playbackState.listen((playbackState) {
      final newState = ProgressBarState(
          current: state.progressBarState.current,
          buffered: playbackState.bufferedPosition,
          total: state.progressBarState.total);
      state = state.copyWith(progressBarState: newState);
    });
  }

  void _listenToTotalDuration() {
    _audioHandlerViewModel.mediaItem.listen((mediaItem) {
      final newState = ProgressBarState(
          current: state.progressBarState.current,
          buffered: state.progressBarState.buffered,
          total: mediaItem?.duration ?? Duration.zero);
      state = state.copyWith(progressBarState: newState);
    });
  }

  void _listenToChangeMusic() {
    _audioHandlerViewModel.mediaItem.listen((value) {
      state = state.copyWith(musicTitle: value?.title ?? "");
    });
  }

  void _listenToIsPlay() {
    _audioHandlerViewModel.playbackState.listen((backState) {
      state = state.copyWith(isPlaying: backState.playing);
    });
  }

  Future<void> tapMusic(int index) async {
    await _audioHandlerViewModel.tapMusic(index);
  }

  Future<void> play() async {
    await _audioHandlerViewModel.play();
  }

  Future<void> stop() async {
    _audioHandlerViewModel.stop();
  }

  Future<void> pause() async {
    _audioHandlerViewModel.pause();
  }

  Future<void> skipToNext() async {
    _audioHandlerViewModel.skipToNext();
  }

  Future<void> skipToPrevious() async {
    _audioHandlerViewModel.skipToPrevious();
  }

  Future<void> addQueueItems() async {
    final List<Music> musicList = await _musicRepository.getListMusics();
    final List<MediaItem> mediaItems = musicList
        .map((music) => MediaItem(id: music.title, title: music.title))
        .toList();
    _audioHandlerViewModel.addQueueItems(mediaItems);
  }

  Future<void> clear() async {
    _audioHandlerViewModel.clear();
  }

  //Musicデータフェッチ
  Future<void> setPlayList() async {
    final List<Music> musicList = state.musicList;
    final List<MediaItem> mediaItems = musicList
        .map((music) => MediaItem(id: music.title, title: music.title))
        .toList();
    await _audioHandlerViewModel.setPlayList(mediaItems);
  }

  Future<void> downLoadMusic(String url) async {
    final Music newMusic = await _musicRepository.downLoadMusic(url);
    final MediaItem mediaItem =
        MediaItem(id: newMusic.title, title: newMusic.title);
    await _audioHandlerViewModel.addQueueItem(mediaItem);
    state.musicList.add(newMusic);
    final newMusicList = state.musicList;
    state = state.copyWith(musicList: newMusicList);
  }

  Future<void> getMusicList() async {
    final List<Music> _musicList = await _musicRepository.getListMusics();
    state = state.copyWith(musicList: _musicList);
  }

  Future<void> seek(Duration position) => _audioHandlerViewModel.seek(position);

  Future<void> removeMusic(int index) async {
    //queueから音楽を削除
    await _audioHandlerViewModel.removeQueueItemAt(index);
    //音楽ファイルを削除
    await _musicRepository.deleteMusic(state.musicList[index].title);
    //画面の音楽を削除
    state.musicList.removeAt(index);
    //新しい音楽Listを挿入
    state = state.copyWith(musicList: state.musicList);
    //新しい音楽を保存。
    await _musicRepository.saveListMusic(state.musicList);
  }

  //アプリがkillされたタイミングで削除
  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.detached) {
      _audioHandlerViewModel.stop();
    }
  }

  @override
  void dispose() {
    // _audioHandlerViewModel.stop();
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }
}
