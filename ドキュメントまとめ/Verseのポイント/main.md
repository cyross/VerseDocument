# Verseのポイント

## Verseのドキュメント

- [Verseを使用したプログラミングを学ぶ](https://dev.epicgames.com/documentation/ja-jp/uefn/learn-programming-with-verse-in-unreal-editor-for-fortnite) 参照

## Verseのプログラムを組む

### Verseプログラミングの事前準備

- UEFNをインストール
  - Epic Game Launcher からインストール可能
- Visual Studio Code (以降、`VSCode`) をインストール
  - [Microsoft の VSCode 公式サイト](https://azure.microsoft.com/ja-jp/products/visual-studio-code)
- VSCode に、 Verse 拡張機能をインストール
  - エディタ左側にある拡張機能ボタンを押す
  - 拡張機能ペインが現れたら、検索ウインドウに「Verse」と入れる
  - 「Verse(作者: epicgames)」を選んでインストールする
  - VSCodeを再起動

### Verseの開発環境を開く

- UEFN の `Verseボタン` をクリックする
  - VSCodeが開き、Verseのプロジェクトがワークスペースに現れる
- プロジェクト名と同じ名前のフォルダが作られるので、そこに自作の `.verse` ファイルを生成する

### Verseのプログラムを実行

- UEFN の `「Verse」メニュー` にある `「Verseコードをビルド」アイテム` を選択
  - UEFN の `「Verse」ボタン` のアイコンが緑地のチェックマークになっていればビルド成功
  - UEFN の `「Verse」ボタン` のアイコンが赤地の一時停止マークになっていればビルド失敗
- デバイスなどを作ったときは、コンテンツブラウザーにアイテムが生成されているので、これをアウトライナーにD&D
  - `creative_device` を継承したときは、 `All/(プロジェクト名) コンテンツ/CreativeDevices` に表示される
- 変更内容をプッシュ(すでにを起動しているとき)
  - UEFN の `「エンドゲーム」ボタン`をクリックして終了
  - UEFN の `「変更をプッシュ」ボタン` をクリック
    - 自動的にゲームが始まる
- セッション開始(フォートナイトを起動していないとき)
  - UEFN の `「セッションを開始」ボタン` をクリック
    - 自動的にゲームが始まる

### Verseのプログラムを終了

- UEFN の `「エンドゲーム」ボタン` をクリック

## ゲーム開始時にイベントを発火させるためには？

- `creative_device.OnBegin` 関数をオーバーライドするしかなさそう
- `/Fortnite.com/Devices` モジュールを `using` して、 `creative_device` を継承したカスタムクラスを作る必要がある
- カスタムクラスのインスタンスを島に置くことでゲーム開始時にイベントを発火させることができる

## プレイヤーがスポーンされるときにアイテムをスポーンする



## Verseスクリプトからインスタンスを生成

- 基本的にVerseでインスタンスを作成してゲーム上に表示させるためには `creative_prop` クラスを継承する
- `Spawn` メソッドで生成
