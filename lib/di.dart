import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:re_re_ca/model/repository_imp/music_repository.dart';
import 'package:re_re_ca/model/repository_imp/video_repository.dart';
import 'package:re_re_ca/state/music_state.dart';
import 'package:re_re_ca/state/video_state.dart';
import 'package:re_re_ca/view_model/music/audio_handler.dart';
import 'package:re_re_ca/view_model/music/music_manager_view_model.dart';
import 'package:re_re_ca/view_model/video/video_view_model.dart';

final musicRepositoryImpProvider =
    Provider<MusicRepository>((ref) => MusicRepository());

final videoRepository = Provider<VideoRepository>((ref) => VideoRepository());

final audioHandlerProvider =
    Provider<AudioHandlerViewModel>((ref) => AudioHandlerViewModel());

//viewModel
final musicManagerViewModelProvider =
    StateNotifierProvider.autoDispose<MusicManagerViewModel, MusicState>((ref) =>
        MusicManagerViewModel(ref.watch(audioHandlerProvider),
            ref.watch(musicRepositoryImpProvider)));

final videoViewModelProvider =
    StateNotifierProvider<VideoViewModel, VideoState>(
        (ref) => VideoViewModel(ref.watch(videoRepository)));
