import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:re_re_ca/di.dart';

class MusicProgressBar extends HookConsumerWidget {
  const MusicProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(musicManagerViewModelProvider.notifier);
    final musicTitle = ref.watch(
        musicManagerViewModelProvider.select((value) => value.musicTitle));
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 150,
        child: Column(
          children: [
            Text(musicTitle),
            Consumer(builder: (context, refCon, _){
              final progressBar =
                  refCon.watch(musicManagerViewModelProvider).progressBarState;
              return ProgressBar(
                  progress: progressBar.current,
                  total: progressBar.total, buffered:
              progressBar.buffered,onSeek: notifier.seek);
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      notifier.skipToPrevious();
                    },
                    icon: const Icon(Icons.skip_previous)),
                PlayIcon(key: key),
                IconButton(
                    onPressed: () {
                      notifier.skipToNext();
                    },
                    icon: const Icon(Icons.skip_next)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PlayIcon extends HookConsumerWidget {
  const PlayIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(musicManagerViewModelProvider).isPlaying;
    final notifier = ref.read(musicManagerViewModelProvider.notifier);
    late Widget iconWidget;
    if (!isPlaying) {
      iconWidget = IconButton(
          onPressed: () {
            notifier.play();
          },
          icon: const Icon(Icons.play_arrow));
    } else {
      iconWidget = IconButton(
          onPressed: () {
            notifier.pause();
          },
          icon: const Icon(Icons.pause));
    }
    return iconWidget;
  }
}
