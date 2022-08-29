import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:re_re_ca/di.dart';
import 'package:re_re_ca/screen/home_screen.dart';
import 'package:re_re_ca/screen/video_list_screen.dart';
import 'package:re_re_ca/view_model/music/audio_handler.dart';

// late AudioHandler _audioHandler;

void main() async {
  final _audioHandler = await AudioService.init(
      builder: () => AudioHandlerViewModel(),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.rereca',
        androidNotificationChannelName: 'Rereca',
        androidNotificationOngoing: true,
        androidStopForegroundOnPause: true,
      ));
  runApp(ProviderScope(
      overrides: [audioHandlerProvider.overrideWithValue(_audioHandler)],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/': (context) => HomeScreen(),
        '/video_list_screen': (context) => const VideoListScreen(),
      },
      // home: const VideoListScreen(),
    );
  }
}
