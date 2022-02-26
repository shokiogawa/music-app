// repositoryからデータ取得
//viewのリビルド
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:re_re_ca/model/entity/music/music.dart';
import 'package:re_re_ca/model/repository_imf/music_repository.dart';
import 'package:re_re_ca/state/music_state.dart';

class MusicViewModel extends StateNotifier<MusicState> {
  final IMusicRepository _musicRepository;

  MusicViewModel(this._musicRepository) : super(const MusicState());

  Future<void> downLoadMusic(String url) async {
    await _musicRepository.downLoadMusic(url);
  }

  Future<void> getMusicList() async {
    final List<Music> _musicList = await _musicRepository.getListMusics();
    state = state.copyWith(musicList: _musicList);
  }
}
