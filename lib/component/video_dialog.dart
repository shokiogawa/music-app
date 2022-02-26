import 'package:flutter/material.dart';
import 'package:re_re_ca/model/entity/video/video.dart';

//TODO: 改良の余地多分にあり。
class VideoDialog extends StatefulWidget {
  final Future<void> Function(String) downloadMusic;
  final Video _video;

  const VideoDialog(Key? key, this.downloadMusic, this._video)
      : super(key: key);

  @override
  _VideoDialogState createState() => _VideoDialogState();
}

class _VideoDialogState extends State<VideoDialog> {
  bool isDownloading = false;
  bool isSuccedd = false;
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return SimpleDialog(
        title: Text(widget._video.title + "をダウンロードしますか？"),
        children: [
          !isDownloading && !isSuccedd
              ? Column(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () async {
                          setState(() {
                            isDownloading = true;
                          });
                          await widget
                              .downloadMusic(widget._video.url)
                              .then((value) {
                            setState(() {
                              isSuccedd = true;
                            });
                          }).catchError((error) {
                            setState(() {
                              isError = true;
                            });
                          });
                          setState(() {
                            isDownloading = false;
                          });
                        },
                        child: const Text("ダウンロード")),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("キャンセルする"))
                  ],
                )
              : Container(),
          isDownloading || isSuccedd
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green.withOpacity(0.5)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(!isSuccedd ? "ダウンロード中。。。" : "ダウンロードに成功しました！"))
              : Container(),
          isError ? const Text("ダウンロードできませんでした。") : const Text("")
        ],
      );
    });
  }
}
