import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:re_re_ca/component/music_progress_bar.dart';
import 'package:re_re_ca/component/music_tile.dart';
import 'package:re_re_ca/di.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(musicManagerViewModelProvider.notifier);
    final musicList = ref.watch(musicManagerViewModelProvider).musicList;
    useEffect(() {
      notifier.init();
    }, const []);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            child: const Text(
              "Get Music",
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/video_list_screen');
            }),
        appBar: AppBar(),
        bottomNavigationBar: const MusicProgressBar(),
        body: ListView.builder(
            itemCount: musicList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  notifier.tapMusic(index);
                },
                child: MusicTile(musicList[index], key)
                // Card(
                //   color: Colors.grey.withOpacity(0.1),
                //   child: Column(
                //     children: [
                //       Image.network(
                //         musicList[index].image,
                //         height: 150,
                //         width: 150,
                //       ),
                //       Text(musicList[index].title),
                //       Text(musicList[index].author),
                //       Align(
                //         alignment: Alignment.topRight,
                //         child: ElevatedButton(
                //             style: ElevatedButton.styleFrom(primary: Colors.red.withOpacity(0.5)),
                //             onPressed: () async {
                //               await notifier.removeMusic(index);
                //             },
                //             child: const Text("削除")),
                //       )
                //     ],
                //   ),
                // ),
              );
            }));
  }
}
