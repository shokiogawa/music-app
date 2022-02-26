import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:re_re_ca/component/video_dialog.dart';
import 'package:re_re_ca/di.dart';
import 'package:re_re_ca/model/entity/video/video.dart';

class VideoCard extends HookConsumerWidget {
  final Video _video;

  const VideoCard(Key? key, this._video) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(musicManagerViewModelProvider.notifier);
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return VideoDialog(key, notifier.downLoadMusic, _video);
            });
        // notifier.downLoadMusic(_video.url);
      },
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AspectRatio(
                  aspectRatio: 12 / 7,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    child: Image.network(
                      _video.thumnail.mediumResUrl,
                      fit: BoxFit.contain,
                    ),
                  )),
              Container(
                  alignment: Alignment.center,
                  height: 60,
                  margin: const EdgeInsets.only(
                      top: 5, bottom: 0, right: 10, left: 10),
                  child: Text(
                    _video.title,
                    textAlign: TextAlign.center,
                  )),
              Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(getVideoMinutes(_video.duration)))
            ],
          )),
    );
  }

  // Widget openDialog(
  //     Future<void> Function(String) downloadMusic, BuildContext context) {
  //   return StatefulBuilder(builder: (context, setState) {
  //     bool isDownloading = false;
  //     bool isSuccedd = false;
  //     bool isError = false;
  //     int testNumber = 0;
  //     return SimpleDialog(
  //       title: Text(_video.title + "をダウンロードしますか？"),
  //       children: [
  //         !isDownloading
  //             ? ElevatedButton(
  //                 style: ElevatedButton.styleFrom(primary: Colors.green),
  //                 onPressed: () async {
  //                   setState(() {
  //                     testNumber++;
  //                   });
  //                   // isDownloading = true;
  //                   // await downloadMusic(_video.url).then((value) {
  //                   //   setState(() {
  //                   //     isDownloading = false;
  //                   //   });
  //                   // }).catchError((error) {
  //                   //   setState(() {
  //                   //     isDownloading = false;
  //                   //   });
  //                   // });
  //                 },
  //                 child: Text(testNumber.toString()))
  //             : Container(),
  //         !isDownloading
  //             ? ElevatedButton(
  //                 style: ElevatedButton.styleFrom(primary: Colors.red),
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text("キャンセルする"))
  //             : Container(),
  //         isDownloading
  //             ? ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //                     primary: Colors.green.withOpacity(0.5)),
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text("ダウンロード中"))
  //             : Container(),
  //       ],
  //     );
  //   });
  // }

  String getVideoMinutes(Duration duration) {
    late String time;
    final String hour = duration.inHours.toString();
    final String minutes = duration.inMinutes.toString();
    final String seconds = duration.inSeconds.toString();
    if (hour != '0') {
      time = hour + '時間' + minutes + '分' + seconds + '秒';
    } else {
      time = minutes + '分' + seconds + '秒';
    }
    return time;
  }
}
