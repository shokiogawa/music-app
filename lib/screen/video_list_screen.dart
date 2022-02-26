import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:re_re_ca/component/text_field.dart';
import 'package:re_re_ca/component/video_card.dart';
import 'package:re_re_ca/di.dart';
import 'package:re_re_ca/model/entity/video/video.dart';

class VideoListScreen extends HookConsumerWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController _textEditingController =
        TextEditingController();
    final notifier = ref.read(videoViewModelProvider.notifier);
    final videoList =
        ref.watch(videoViewModelProvider.select((value) => value.videoList));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: const Text(
            "Back",
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            Navigator.pop(context);
            // Navigator.pop(context);
          }),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: MyTextField(_textEditingController, key),
        actions: [
          IconButton(
            onPressed: () async {
              await notifier.getVideoLists(_textEditingController.text);
            },
            icon: const Icon(Icons.search),
            color: Colors.green,
          )
        ],
      ),
      body: ListView.builder(
          itemCount: videoList.length,
          itemBuilder: (BuildContext context, int index) {
            return VideoCard(key, videoList[index]);
          }),
    );
  }
}
