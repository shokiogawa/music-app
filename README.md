# ReReca

音楽をダウンロードし、バックグラウンドで再生するアプリです。

## 参考サイト
基本的に、以下の2つのサイトを参考に作成しました。

https://zenn.dev/majo/articles/c2d25a5153dd0d

https://suragch.medium.com/background-audio-in-flutter-with-audio-service-and-just-audio-3cce17b4a7d


## 使用パッケージ

##### Youtube動画を保存する関連
* [youtube_explore_dart](https://pub.dev/packages/youtube_explode_dart)
* [path_provider](https://pub.dev/packages/path_provider)
* [shared_preferences](https://pub.dev/packages/shared_preferences)

##### 保存した音楽を再生する関連
* [just_audio](https://pub.dev/packages/just_audio)
* [audio_service](https://pub.dev/packages/audio_service)
* [audio_video_progress_bar](https://pub.dev/packages/audio_video_progress_bar)

#### 状態管理関連
* [riverpod](https://pub.dev/packages/riverpod)
* [flutter_hooks](https://pub.dev/packages/flutter_hooks)
* [hopks_riverpod](https://pub.dev/packages/hooks_riverpod)
* [freezed](https://pub.dev/packages/freezed)

今回、パッケージフル活用です。

## 主な流れ
具体的には、以下の流れで音楽をダウンロードし、バックグラウンド再生します。

1. youtube_explore_dartでYoutube音楽を取得
2. path_providerで1で取得した音楽データをスマホのファイルに保存
3. shared_preferencesで音楽のデータ(名前、画像パス、音楽の長さ)などを保存
4. just_audioでアプリ内で音楽再生
5. audio_serviceを使いバックグラウンドで音楽を再生

基本的に、Youtubeから音楽をダウンロードするには、yotube_explore_dartパッケージを使ったら簡単にできてしまいます。

音楽をバックグラウンドで再生するのも、最初に提示したサイトを参考に作っていけばこれも簡単にできてしまいます。
