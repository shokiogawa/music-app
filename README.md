# ReReca

音楽をダウンロードし、バックグラウンドで再生するアプリです。

## アーキテクチャー
MVVMアーキテクチャー

## 状態管理
riverpod + stateNotifier + freezed

## ディレクトリ構造
lib/
  ├ component
  ├ model
      ├ entity
           ├ music
           ├ video
      ├ repository_imf
      ├ repository_imp
  ├ screen
  ├ state
  ├ view_model
  di.dart
  main.dart
