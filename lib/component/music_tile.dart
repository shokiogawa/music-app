import 'package:flutter/material.dart';
import 'package:re_re_ca/model/entity/music/music.dart';
class MusicTile extends StatelessWidget {
  final Music? music;
  final void Function()? onPressed;
  const MusicTile({this.music,this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
      child: ListTile(
        leading: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)),
            child: Image.network(music!.image)),
        title: Text(music!.title),
        subtitle: Text(music!.author),
        trailing: IconButton(onPressed: onPressed, icon: const Icon(Icons.delete), color: Colors.red),
      ),
    );
  }
}
