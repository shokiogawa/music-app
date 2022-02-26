import 'package:audio_service/audio_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:re_re_ca/model/repository_imp/music_repository.dart';
import 'package:re_re_ca/state/music_state.dart';
import 'package:re_re_ca/state/video_state.dart';
import 'package:re_re_ca/view_model/music/audio_handler.dart';
import 'package:re_re_ca/view_model/music/music_manager_view_model.dart';
import 'package:re_re_ca/view_model/music/music_view_model.dart';
import 'package:re_re_ca/view_model/music/video_view_model.dart';

final musicRepositoryImpProvider =
    Provider<MusicRepository>((ref) => MusicRepository());

final musicViewModelProvider =
    StateNotifierProvider<MusicViewModel, MusicState>(
        (ref) => MusicViewModel(ref.watch(musicRepositoryImpProvider)));

final videoViewModelProvider =
    StateNotifierProvider<VideoViewModel, VideoState>(
        (ref) => VideoViewModel(ref.watch(musicRepositoryImpProvider)));

final audioHandlerProvider =
    Provider<AudioHandlerViewModel>((ref) => AudioHandlerViewModel());
//
// final audioHandlerViewModel =
//     Provider<AudioHandlerViewModel>((ref) => AudioHandlerViewModel());
//
final musicManagerViewModelProvider =
    StateNotifierProvider<MusicManagerViewModel, MusicState>((ref) =>
        MusicManagerViewModel(ref.watch(audioHandlerProvider),
            ref.watch(musicRepositoryImpProvider)));
